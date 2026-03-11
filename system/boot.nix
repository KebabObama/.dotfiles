{
  pkgs,
  inputs,
  lib,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["aesni_intel" "cryptd"];
      systemd.enable = lib.mkDefault true;
      verbose = lib.mkDefault false;
    };
    supportedFilesystems = {
      cifs = true;
      ntfs = true;
    };

    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    consoleLogLevel = lib.mkDefault 0;

    loader = {
      efi.canTouchEfiVariables = lib.mkDefault true;
      timeout = lib.mkDefault 2;
      systemd-boot.enable = lib.mkForce false;
      grub = {
        enable = lib.mkDefault true;
        enableCryptodisk = lib.mkDefault true;
        efiSupport = lib.mkDefault true;
        useOSProber = lib.mkDefault false;
        device = lib.mkDefault "nodev";
        theme = lib.mkDefault "${inputs.virtuaverse-grub}/grub/themes/virtuaverse";
        backgroundColor = lib.mkDefault "#000000";
        splashImage = lib.mkForce null;
        timeoutStyle = lib.mkDefault "menu";
      };
    };
  };
}
