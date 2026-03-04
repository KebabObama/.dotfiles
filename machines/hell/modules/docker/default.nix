{
  hardware.nvidia-container-toolkit = {
    enable = true;
    discovery-mode = "auto";
    device-name-strategy = "index";
    mount-nvidia-executables = true;
  };
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    listenOptions = ["/run/docker.sock"];
    daemon.settings = {
      bip = "192.168.50.1/24";
      default-address-pools = [
        {
          base = "172.20.0.0/16";
          size = 24;
        }
      ];
    };
  };
}
