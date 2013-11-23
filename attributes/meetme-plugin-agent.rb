#
# Cookbook Name:: newrelic
# Attributes:: meetme-plugin-agent
#
# Copyright 2012-2013, Escape Studios
#

default['newrelic']['service_name'] = "newrelic-plugin-agent"
default['newrelic']['wake_interval'] = 60
default['newrelic']['config_file'] = "/etc/newrelic/newrelic_plugin_agent.cfg"
default['newrelic']['pid_file'] = "/var/run/newrelic/newrelic_plugin_agent.pid"
default['newrelic']['log_file'] = "/var/log/newrelic/newrelic_plugin_agent.log"
default['newrelic']['user'] = "newrelic"
default['newrelic']['additional_requirements'] = {}