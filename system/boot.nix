{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];
  boot = {
    initrd.availableKernelModules = ["aesni_intel" "cryptd"];
    initrd.systemd.enable = lib.mkDefault true;
    initrd.verbose = lib.mkDefault false;
    supportedFilesystems = {
      cifs = true;
      ntfs = true;
    };

    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    consoleLogLevel = lib.mkDefault 0;

    lanzaboote = lib.mkIf config.boot.secure {
      enable = true;
      autoGenerateKeys.enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoEnrollKeys.enable = true;
      autoEnrollKeys.autoReboot = true;
    };

    loader = {
      efi.canTouchEfiVariables = lib.mkDefault true;
      timeout = lib.mkDefault 2;
      systemd-boot.enable = lib.mkForce false;
      grub = {
        enable = lib.mkDefault (!config.boot.secure or true);
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
