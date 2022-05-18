package 'redis-server' do
  action :install
end

service 'redis-server' do
  service_name 'redis-server'
  action [ :enable, :start ]
end

template '/etc/redis/redis.conf' do
  source 'redis.conf.erb'
  owner 'redis'
  group 'redis'
  mode '0640'
end