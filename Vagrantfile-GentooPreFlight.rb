Vagrant.configure("2") do |config|
    config.vm.provision "shell", path: "../../../gentoo-preflight.sh"
end
