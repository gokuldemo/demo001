#
# Cookbook Name:: role-app-go
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'apt'
apt_package 'gccgo-go' do
  action :install
end

folds = ['/opt/go/bin', '/opt/go/src/goapp']

for fold in folds
  directory fold do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    recursive true
  end
end

cookbook_file '/opt/go/src/goapp/goapp.go' do
  source 'goapp.go'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :run, 'execute[goapp]', :immediately
end

execute 'goapp' do
  command 'go build -o /opt/go/bin/goapp /opt/go/src/goapp/goapp.go'
end

cookbook_file '/etc/init/goapp.conf' do
  source 'goapp.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

link '/etc/init.d/goapp' do
  to '/etc/init/goapp.conf'
end

service 'goapp' do
  action [:enable, :start]
end
