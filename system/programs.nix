{
  pkgs,
  inputs,
  lib,
  config,
  self,
  ...
}: let
  internalPackages =
    if config.useInternalPackages
    then (builtins.attrValues self.packages.${pkgs.stdenv.hostPlatform.system})
    else [];
in {
  environment.systemPackages = with pkgs;
    internalPackages
    ++ [
      inputs.disko.packages.${stdenv.hostPlatform.system}.default
      wget
      curl
      ntfs3g
      sops
    ];

  services.envfs.enable = lib.mkDefault true;

  programs = {
    nano.enable = lib.mkDefault true;
    nix-ld.enable = lib.mkDefault true;

    git = {
      enable = lib.mkDefault true;
      config = {
        core.editor = lib.mkDefault "$EDITOR";
        init.defaultBranch = lib.mkDefault "master";
        url."https://github.com/".insteadOf = lib.mkDefault ["github:"];
      };
    };

    vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      package = lib.mkDefault pkgs.vim-full;
    };

    nh = {
      enable = lib.mkDefault (!config.useInternalPackages);
      flake = "$HOME/.dotfiles";
      clean.enable = lib.mkDefault true;
      clean.extraArgs = lib.mkDefault "--keep 5 --keep-since 5d";
    };
  };
}
