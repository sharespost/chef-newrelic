#
# Cookbook Name:: newrelic
# Attributes:: nodejs_agent
#
# Copyright 2012-2014, Escape Studios
#

default['newrelic']['nodejs_agent']['agent_action'] = :install
default['newrelic']['nodejs_agent']['apps'] = []
default['newrelic']['nodejs_agent']['template']['cookbook'] = 'newrelic'
default['newrelic']['nodejs_agent']['template']['source'] = 'agent/nodejs/newrelic.js.erb'
