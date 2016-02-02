#
# Cookbook Name:: newrelic
# Attributes:: php_agent
#
# Copyright 2012-2015, Escape Studios
#

default['newrelic']['php_agent']['agent_action'] = nil
default['newrelic']['php_agent']['install_silently'] = nil
default['newrelic']['php_agent']['startup_mode'] = nil
default['newrelic']['php_agent']['web_server']['service_name'] = nil
default['newrelic']['php_agent']['web_server']['service_action'] = nil
default['newrelic']['php_agent']['config_file'] = nil
default['newrelic']['php_agent']['config_file_to_be_deleted'] = nil
default['newrelic']['php_agent']['execute_php5enmod'] = nil
default['newrelic']['php_agent']['template']['cookbook_ini'] = nil
default['newrelic']['php_agent']['template']['source_ini'] = nil
default['newrelic']['php_agent']['template']['cookbook'] = nil
default['newrelic']['php_agent']['template']['source'] = nil
default['newrelic']['php_agent']['additional_config'] = {
  "newrelic.attributes.include" => "request.parameters.Action",
  "newrelic.attributes.include" => "request.parameters.ReportType",
  "newrelic.attributes.include" => "request.parameters.AccessID",
  "newrelic.attributes.include" => "request.parameters.DocumentID",
  "newrelic.attributes.include" => "request.parameters.FirmID",
  "newrelic.attributes.include" => "request.parameters.UserID"
}
