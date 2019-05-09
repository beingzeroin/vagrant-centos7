CFG_MEMSIZE = "2048"    # max memory for each VM
SERVER_COUNT = 1
NETWORK = '10.211.55.'
FIRST_IP = 100
NAME_PREFIX = 'server'

# Configure VM servers
servers = []
(1..SERVER_COUNT).each do |i|
  name = NAME_PREFIX + i.to_s
  ip = NETWORK + (FIRST_IP + i).to_s
  servers << {'name' => name, 'ip' => ip}
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  servers.each do |server|
    config.vm.define server['name'] do |config2|
      config2.vm.hostname = server['name']
      config2.vm.network :private_network, ip: server['ip']
      config2.vm.synced_folder ".", "/vagrant", type: "rsync"

      #if (server['name'] == 'node0')
      #  config2.vm.provision :shell, :inline => opsc_script
      #else
      #  config2.vm.provision :shell, :inline => node_script
      #end

      config2.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"]  = CFG_MEMSIZE
      end
      config2.vm.provider :virtualbox do |v|
        v.name = server['name']
        v.customize ["modifyvm", :id, "--memory", CFG_MEMSIZE]
      end

    end
  end
end