{lib, ...}: {
  hardware.nvidia-container-toolkit = {
    enable = lib.mkDefault false;
    discovery-mode = lib.mkDefault "auto";
    device-name-strategy = lib.mkDefault "index";
    mount-nvidia-executables = lib.mkDefault false;
  };
  virtualisation.docker = {
    enable = lib.mkDefault true;
    enableOnBoot = lib.mkDefault false;
    listenOptions = ["/run/docker.sock"];
  };
}
