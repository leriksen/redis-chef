# See http://docs.chef.io/workstation/config_rb/ for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "leriksen"
client_key               "#{current_dir}/leriksen.pem"
chef_server_url          "https://api.chef.io/organizations/m0th3r5h1p"
cookbook_path            ["#{current_dir}/../cookbooks"]
