Vagrant.configure("2") do |config|
  config.vm.box = "azure"

  config.ssh.private_key_path = '~/.ssh/id_rsa'

  config.vm.provider :azure do |azure, override|
    azure.vm_name              = "redis"
    azure.admin_username       = "vagrant"
#     azure.vm_image_urn         = "Canonical:UbuntuServer:18.04-LTS:latest"
    azure.vm_image_urn         = "RedHat:RHEL:86-gen2:latest"

    azure.resource_group_name  = "testing"
    azure.virtual_network_name = "testing-vnet"
    azure.subnet_name          = "default"
    azure.location             = "australiasoutheast"

    override.vm.synced_folder ".", "/vagrant", disabled: true

    # each of the below values will default to use the env vars named as below if not specified explicitly
    azure.tenant_id       = ENV['AZURE_TENANT_ID']
    azure.client_id       = ENV['AZURE_CLIENT_ID']
    azure.client_secret   = ENV['AZURE_CLIENT_SECRET']
    azure.subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
  end

  config.vm.provision "yum update", type: "shell", inline: <<-SHELL
    echo "Running 'yum -y update'"
#       apt-get update
    yum -y update
  SHELL
end

