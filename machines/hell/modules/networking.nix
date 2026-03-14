{
  services = {
    printing.enable = true;
    avahi.enable = true;
    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PrintMotd = true;
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        StreamLocalBindUnlink = true;
        GatewayPorts = "clientspecified";
      };
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [7236 7250];
      allowedUDPPorts = [7236 5353];
      trustedInterfaces = ["virbr0" "p2p-wl+"];
      allowedTCPPortRanges = [
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };
}
