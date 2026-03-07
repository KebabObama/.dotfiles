{inputs ? {}, ...}: {
  imports = [(inputs.disko.nixosModules.disko or null)];

  disko.devices.disk = {
    main = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
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
