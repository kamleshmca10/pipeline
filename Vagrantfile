# by Kami Gerami 
#
# vars
domain = "example.com"

# Add new nodes here
nodes = [
  { :hostname => "jenkinsmaster-01.#{domain}", :ip => "192.168.50.10"},
  { :hostname => "jenkinsslave-01.#{domain}", :ip => "192.168.50.20"},
  { :hostname => "registry-01.#{domain}", :ip => "192.168.50.30"},
  { :hostname => "dev-01.#{domain}", :ip => "192.168.50.40"},
  { :hostname => "prod-01.#{domain}", :ip => "192.168.50.50"},
]

Vagrant.configure(2) do |config|
  
  nodes.each do |node|
    # Set the vars
    hostname = node[:hostname]
    ip = node[:ip]

      config.vm.box = "centos/7"

      config.vm.define hostname do |config|
        config.vm.hostname = hostname
        config.vm.network :private_network, ip: ip
      end

       end
       # ansible provisioner
        config.vm.provision :ansible do |ansible| 
          ansible.playbook = "provisioning/site.yml"
          ansible.sudo = true
        end


  end    
