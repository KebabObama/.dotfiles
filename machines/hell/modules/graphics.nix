{pkgs, ...}: {
  services = {
    fwupd.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      displayManager.startx.enable = true;
      desktopManager.xterm.enable = false;
      deviceSection = ''Option "TearFree" "true"'';
      videoDrivers = ["nvidia" "modesetting"];
    };
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-validation-layers
    directx-headers
  ];

  hardware = {
    firmware = [pkgs.linux-firmware];
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages32 = [pkgs.pkgsi686Linux.intel-media-driver];
      extraPackages = with pkgs; [
        intel-media-driver
        libva
        libva-utils
      ];
    };
    nvidia = {
      open = true;
      forceFullCompositionPipeline = true;
      powerManagement.finegrained = true;
      powerManagement.enable = true;
      videoAcceleration = true;
      dynamicBoost.enable = true;
      nvidiaPersistenced = true;
      modesetting.enable = true;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
          offloadCmdMainProgram = "nv";
        };
      };
    };
  };
}
