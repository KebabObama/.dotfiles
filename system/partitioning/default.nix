{
  inputs ? {},
  nixpkgs ? import <nixpkgs> {},
  lib ? nixpkgs.lib,
  defaultDriveName ? "/dev/nvme0n1",
  defaultContentType ? "gpt",
  ...
}: {
  imports =
    if (inputs ? disko)
    then [inputs.disko.nixosModules.disko]
    else [];

  disko.devices.disk = lib.mkDefault {
    main = {
      device = lib.mkDefault defaultDriveName;
      type = "disk";
      content = {
        type = lib.mkDefault defaultContentType;
        partitions = {
          ESP = {
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              extraArgs = ["-n" "BOOT"];
              mountOptions = ["fmask=0077" "dmask=0077"];
            };
          };
          swap = {
            size = "16G";
            content = {
              type = "swap";
              extraArgs = ["-L" "SWAP"];
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              extraArgs = ["-L" "ROOT"];
            };
          };
        };
      };
    };
  };
}
