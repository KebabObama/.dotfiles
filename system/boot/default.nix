{
  pkgs,
  inputs,
  lib,
  ...
}: {
  boot = {
    supportedFilesystems = {
      cifs = true;
      ntfs = true;
    };

    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelParams = lib.mkDefault ["mem_sleep_default=deep"];
    consoleLogLevel = lib.mkDefault 0;
    initrd.verbose = lib.mkDefault false;

    loader = {
      systemd-boot.enable = lib.mkDefault false;
      efi.canTouchEfiVariables = lib.mkDefault true;
      timeout = lib.mkDefault 2;

      grub = {
        enable = lib.mkDefault true;
        efiSupport = lib.mkDefault true;
        useOSProber = lib.mkDefault false;
        device = lib.mkDefault "nodev";
        theme = lib.mkDefault "${inputs.virtuaverse-grub}/grub/themes/virtuaverse";
        backgroundColor = lib.mkDefault "#000000";
        splashImage = lib.mkForce null;
        timeoutStyle = lib.mkDefault "menu";
        efiInstallAsRemovable = lib.mkDefault false;
      };
    };
  };
}
