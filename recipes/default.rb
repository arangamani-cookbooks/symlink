#
# Cookbook Name:: symlink
# Recipe:: default
#
# Copyright (C) 2013 Kannan Manickam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node['symlink']['links'].each do |link_from, link_to|
  log "Linking #{link_from} >> #{link_to}"
  link from do
    owner node['symlink']['user'] unless node['symlink']['user'].empty?
    group node['symlink']['group'] unless node['symlink']['group'].empty?
    link_type node['symlink']['link_type']
    to link_to
 end
end
