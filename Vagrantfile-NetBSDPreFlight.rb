Vagrant.configure("2") do |config|
    config.ssh.shell = "sh"
    config.vm.provision "shell", path: "../../../netbsd-preflight.sh"
end
