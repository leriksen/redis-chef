Vagrant.configure("2") do |config|
  config.vm.box = "azure"

  config.ssh.private_key_path = '~/.ssh/id_rsa'

  config.vm.provider :azure do |azure, override|
    azure.vm_name              = "redis"
    azure.admin_username       = "vagrant"
    azure.vm_image_urn         = "Canonical:UbuntuServer:18.04-LTS:latest"

    azure.resource_group_name  = "testing"
    azure.virtual_network_name = "testing-vnet"
    azure.subnet_name          = "default"
    azure.location             = "australiasoutheast"

    override.vm.synced_folder ".", "/vagrant", disabled: true
  end

  config.vm.provision "redis", type: "shell", inline: <<-SHELL
      apt-get update
  SHELL
end

