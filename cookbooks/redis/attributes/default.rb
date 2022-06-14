case node['platform_family']
when 'debian'
  default['redis']['sysconfig_dir'] = '/etc/default'
  default['redis']['pkg_name'] = 'redis-server'
  default['redis']['conf_dir'] = '/etc/redis'
  default['redis']['service_name'] = 'redis'
when 'rhel', 'fedora'
  default['redis']['sysconfig_dir'] = '/etc/sysconfig'
  default['redis']['pkg_name'] = 'redis'
  default['redis']['conf_dir'] = '/etc'
  default['redis']['service_name'] = 'redis'
end
default['redis']['port'] = 6379
default['redis']['group'] = 'redis'
