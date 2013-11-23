#
# Cookbook Name:: newrelic
# Recipe:: meetme-plugin-agent
#
# Copyright 2012-2013, Escape Studios
#

include_recipe "python::pip"

#install latest plugin agent
python_pip "#{node['newrelic']['service_name']}" do
    action :upgrade
end

##create the configuration, run and log directories,
##making sure they are writable by the user specified in the configuration file
#files = [
#    node['newrelic']['config_file'],
#    node['newrelic']['pid_file'],
#    node['newrelic']['log_file']
#]
#
#files.each do |file|
#    directory ::File.dirname(dir) do
#        owner "#{node['newrelic']['user']}"
#        #group "#{node['newrelic']['group']}"
#        mode "0755"
#    end
#end
#
##configuration file
#template "#{node['newrelic']['config_file']}" do
#    source "meetme_plugin_agent.cfg.erb"
#    owner "root"
#    group "root"
#    mode "0644"
#    variables(
#        :license_key => node['newrelic']['plugin_agent']['license'],
#        :wake_interval => node['newrelic']['wake_interval'],
#        :user => node['newrelic']['user'],
#        :pid_file => node['newrelic']['pid_file'],
#        :log_file => node['newrelic']['log_file']
#    )
#    action :create
#    notifies :restart, "service[#{node['newrelic']['service_name']}]", :delayed
#end
#
##installing additional requirement(s)
#node['newrelic']['additional_requirements'].each do |additional_requirement|
#    python_pip "newrelic_plugin_agent[#{additional_requirement}]" do
#        action :upgrade
#    end
#end
#
#service "#{node['newrelic']['service_name']}" do
#    start_command "newrelic_plugin_agent -c #{node['newrelic']['config_file']}"
#    supports :status => true, :start => true, :stop => true, :restart => true
#    action [:enable, :start] #starts the service if it's not running and enables it to start at system boot time
#end