#
# Cookbook Name:: chef-rundeck
# Provider:: plugin
#
# Author:: Panagiotis Papadomitsos (<pj@ezgr.net>)
#
# Copyright 2014, Panagiotis Papadomitsos
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :create do
  plugin_filename = ::File.basename(new_resource.url)
  Chef::Application.fatal!("Invalid filename extension for Rundeck plugin #{new_resource.name}") \
    unless ::File.extname(plugin_filename).eql?('.zip') || ::File.extname(plugin_filename).eql?('.jar')
  a = remote_file "/var/lib/rundeck/libext/#{new_resource.name}" do
    owner 'rundeck'
    group 'rundeck'
    mode 00644
    action :create
    source new_resource.url
    checksum(new_resource.checksum) if new_resource.checksum
  end
  new_resource.updated_by_last_action(a.updated_by_last_action?)
end

action :remove do
  a = file "/var/lib/rundeck/libext/#{new_resource.name}" do
    action :delete
  end
  new_resource.updated_by_last_action(a.updated_by_last_action?)
end
