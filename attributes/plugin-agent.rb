#
# Cookbook Name:: newrelic
# Attributes:: plugin-agent
#
# Copyright 2012-2013, Escape Studios
#

default['newrelic']['plugin_agent']['service_name'] = "newrelic-plugin-agent"
default['newrelic']['plugin_agent']['services'] = nil
default['newrelic']['plugin_agent']['wake_interval'] = 60
default['newrelic']['plugin_agent']['config_file'] = "/etc/newrelic/newrelic_plugin_agent.cfg"
default['newrelic']['plugin_agent']['pid_file'] = "/var/run/newrelic/newrelic_plugin_agent.pid"
default['newrelic']['plugin_agent']['log_file'] = "/var/log/newrelic/newrelic_plugin_agent.log"
default['newrelic']['plugin_agent']['user'] = "newrelic"
default['newrelic']['plugin_agent']['additional_requirements'] = {}