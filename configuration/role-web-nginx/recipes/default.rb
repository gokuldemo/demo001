#
# Cookbook Name:: role-web-nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'nginx'
template 'nginx.conf' do
  path   "#{node['nginx']['dir']}/nginx.conf"
  source 'nginx.conf.erb'
  notifies :reload, 'service[nginx]', :delayed
end

template "#{node['nginx']['dir']}/sites-available/default" do
  source 'default-site.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'default' do
  enable node['nginx']['default_site_enabled']
end

service 'nginx' do
  action :nothing
end
