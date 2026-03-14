{
  pkgs,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages =
    [inputs.disko.packages.${pkgs.stdenv.hostPlatform.system}.default]
    ++ (with pkgs; [
      git
      wget
      curl
      ntfs3g
      sops
    ]);

  services.envfs.enable = lib.mkDefault true;
  services.dbus.enable = lib.mkDefault true;
  security.polkit.enable = lib.mkDefault true;
  security.rtkit.enable = lib.mkDefault true;

  programs = {
    nano.enable = lib.mkDefault false;
    nix-ld.enable = lib.mkDefault true;

    vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      package = lib.mkDefault pkgs.vim-full;
    };

    nh = {
      enable = lib.mkDefault true;
      flake = "$HOME/.dotfiles";
      clean.enable = lib.mkDefault true;
      clean.extraArgs = lib.mkDefault "--keep 5 --keep-since 5d";
    };
  };
}
