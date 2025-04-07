{ config, pkgs, inputs, username,... }:{
  imports = [ # Include the results of the hardware scan.
      ./../modules/nixos/default.nix
      ./hardware-configuration.nix
    ];
}
