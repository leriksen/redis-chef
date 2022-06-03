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