package node['redis']['pkg_name'] do
  action :install
end

service node['redis']['service_name'] do
  service_name node['redis']['service_name']
  action [ :enable, :start ]
end

template File.join(node['redis']['conf_dir'], 'redis.conf') do
  source 'redis.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

template File.join(node['redis']['sysconfig_dir'], node['redis']['pkg_name']) do
  source 'redis.sysconfig.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

include_recipe 'devops::default'

group node['redis']['group'] do
  append true
  comment 'add devops unix user to the redis group so they can read logs'
  members [ node['accounts']['devops']['unix_user'] ]
  action :modify
end

directory "#{node['redis']['certs_path']}" do
  recursive true
  action :create
end

file "#{node['redis']['certs_path']}/#{node['redis']['cert_name']}.key" do
  content 'this is the content'
  mode '0644'
  action :create
end