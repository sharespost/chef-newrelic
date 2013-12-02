#
# Cookbook Name:: newrelic
# Recipe:: plugin-agent
#
# Copyright 2012-2013, Escape Studios
#

include_recipe "python::pip"

#install latest plugin agent
python_pip "#{node['newrelic']['plugin_agent']['service_name']}" do
    action :upgrade
end

#create the configuration, run and log directories,
#making sure they are writable by the user specified in the configuration file
files = [
    node['newrelic']['plugin_agent']['config_file'],
    node['newrelic']['plugin_agent']['pid_file'],
    node['newrelic']['plugin_agent']['log_file']
]

files.each do |file|
    directory ::File.dirname(file) do
        owner "#{node['newrelic']['plugin_agent']['user']}"
        group "#{node['newrelic']['plugin_agent']['user']}"
        mode "0755"
    end
end

services_yml = nil
services = node['newrelic']['plugin_agent']['services']

unless services.nil?
    require 'yaml'
    services_yml = services.to_yaml
end

#configuration file
template "#{node['newrelic']['plugin_agent']['config_file']}" do
    source "plugin_agent.cfg.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
        :license_key => node['newrelic']['plugin_agent']['license'],
        :wake_interval => node['newrelic']['plugin_agent']['wake_interval'],
        :user => node['newrelic']['plugin_agent']['user'],
        :pid_file => node['newrelic']['plugin_agent']['pid_file'],
        :log_file => node['newrelic']['plugin_agent']['log_file'],
        :services => services_yml
    )
    action :create
    notifies :restart, "service[#{node['newrelic']['plugin_agent']['service_name']}]", :delayed
end

#installing additional requirement(s)
node['newrelic']['plugin_agent']['additional_requirements'].each do |additional_requirement|
    python_pip "newrelic_plugin_agent[#{additional_requirement}]" do
        action :upgrade
    end
end

#init script
case node['platform']
    when "debian", "ubuntu", "redhat", "centos", "fedora", "scientific", "amazon", "smartos"        
        template "/etc/init.d/newrelic-plugin-agent" do
        	source "plugin_agent_init.erb"
            mode "0755"
            variables(
                :config_file => node['newrelic']['plugin_agent']['config_file'],
                :pid_file => node['newrelic']['plugin_agent']['pid_file'],
                :user => node['newrelic']['plugin_agent']['user'],
                :group => node['newrelic']['plugin_agent']['user']
            )
        end
end

service "#{node['newrelic']['plugin_agent']['service_name']}" do
    supports :status => true, :start => true, :stop => true, :restart => true
    action [:enable, :start] #starts the service if it's not running and enables it to start at system boot time
end