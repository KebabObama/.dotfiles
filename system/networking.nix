{
  host,
  pkgs,
  lib,
  config,
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
      settings.PrintMotd = lib.mkDefault false;
      authorizedKeysFiles = lib.mkBefore [config.sops.secrets.hell-rsa-pub.path];
      hostKeys = [];
    };

    printing = {
      enable = lib.mkDefault false;
      drivers = lib.mkBefore [
        pkgs.gutenprint
        pkgs.hplip
        pkgs.canon-cups-ufr2
        pkgs.cnijfilter2
      ];
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
    firewall.enable = lib.mkDefault false;
    nameservers = lib.mkDefault ["1.1.1.1" "8.8.8.8" "8.8.4.4"];
    networkmanager = {
      enable = lib.mkDefault true;
      dhcp = lib.mkDefault "internal";
      dns = lib.mkDefault "systemd-resolved";
      wifi = {
        powersave = lib.mkDefault false;
        backend = lib.mkDefault "iwd";
        scanRandMacAddress = lib.mkDefault false;
      };
    };
  };
}
