{
  host,
  pkgs,
  lib,
  ...
}: {
  services = {
    fail2ban.enable = lib.mkDefault false;
    resolved.enable = lib.mkDefault true;

    avahi = {
      enable = lib.mkDefault false;
      nssmdns4 = lib.mkDefault true;
      openFirewall = lib.mkDefault true;
    };

    openssh = {
      enable = lib.mkDefault false;
      settings.PrintMotd = lib.mkDefault true;
      hostKeys = [];
      openFirewall = lib.mkDefault true;
    };

    printing = {
      enable = lib.mkDefault false;
      webInterface = lib.mkDefault true;
      defaultShared = lib.mkDefault true;
    };
  };

  hardware.bluetooth = {
    enable = lib.mkDefault false;
    powerOnBoot = lib.mkDefault true;
    package = lib.mkDefault pkgs.bluez;
    settings.General = {
      AlwaysPairable = lib.mkDefault true;
      ControllerMode = lib.mkDefault "dual";
      MaxControllers = lib.mkDefault 0;
      FastConnectable = lib.mkDefault true;
      Experimental = lib.mkDefault false;
      Enable = lib.mkDefault "Source,Sink,Media,Socket";
    };
  };

  networking = {
    hostName = host;
    enableIPv6 = lib.mkDefault true;
    nameservers = lib.mkDefault ["1.1.1.1" "8.8.8.8" "8.8.4.4"];
    firewall = {
      enable = lib.mkDefault false;
      allowPing = lib.mkDefault true;
    };
    networkmanager = {
      enable = lib.mkDefault true;
      dhcp = lib.mkDefault "internal";
      dns = lib.mkDefault "systemd-resolved";
      wifi = {
        powersave = lib.mkDefault true;
        backend = lib.mkDefault "iwd";
        scanRandMacAddress = lib.mkDefault false;
      };
    };
  };
}
