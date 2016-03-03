VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "win_vs_iis_1.0.0.box"
  hostname = "dev.vagrant"
  ip_address = "10.0.0.254"
  host_port = 5895
  
  # WinRM communication setup
  config.winrm.host = "localhost"
  config.winrm.password = "password"
  config.winrm.port = host_port
  config.winrm.guest_port = host_port
  
  # Configure the vm ports
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.vm.network :forwarded_port,   guest: 3389, host: 3399,       id: "rdp",   auto_correct: false
  config.vm.network :forwarded_port,   guest: 5985, host: host_port,  id: "winrm", auto_correct: false
  config.vm.network :forwarded_port,   guest: 80,   host: 8000,       id: "web" # Port forward for IIS
  config.vm.network :forwarded_port,   guest: 443,  host: 8443,       id: "ssl" # Port forward for SSL IIS
  config.vm.network :forwarded_port,   guest: 4018, host: 4018,       id: "remotevsdebug"
  config.vm.network "private_network", ip: ip_address

  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end

  if Vagrant.has_plugin?("vagrant-multi-hostsupdater")
    config.multihostsupdater.aliases = {ip_address => [hostname]}
  end

  # Configure the synced source folder
  config.vm.synced_folder '.', "/cygdrive/c/vagrant",
    type: "rsync",
    rsync__exclude: [".git/", "packer/", "*.box", "output-*", "Vagrantfile"],
    id: "vagrant"
end
