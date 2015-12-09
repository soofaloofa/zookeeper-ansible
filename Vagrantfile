# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.network "forwarded_port", guest: 2181, host: 2181
  config.vm.network "forwarded_port", guest: 2888, host: 2888
  config.vm.network "forwarded_port", guest: 3888, host: 3888
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "zookeeper_servers" => ["default"],
    }
    ansible.verbose = "v"
    ansible.playbook = "site.yml"
  end
end
