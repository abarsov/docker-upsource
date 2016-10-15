# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # fix "stdin: is not a tty" error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.network "private_network", ip: "192.168.100.12"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision :docker do |d|
    d.build_image "/vagrant",
      args: "-t alonsodomin/upsource"

    d.run "upsource",
      image: "alonsodomin/upsource",
      args: "-p 8080:8080 -v /var/lib/upsource:/var/lib/upsource"
  end

end
