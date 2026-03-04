{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  credentialScript = pkgs.writeShellScript "credential-github" ''
    # bash
    case "$1" in
      get)
        echo "username=x-access-token"
        echo "password=$(cat ${config.sops.secrets.github-token.path})"
        ;;
    esac
  '';
in {
  environment.systemPackages = [
    inputs.disko.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.wget
    pkgs.curl
    pkgs.sops
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
        credential."https://github.com".helper = lib.mkDefault credentialScript;
        url."https://github.com/".insteadOf = lib.mkDefault ["github:"];
      };
    };

    vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      package = lib.mkDefault pkgs.vim-full;
    };

    nh = {
      enable = lib.mkDefault true;
      flake = "$HOME/.dotfiles";
      clean.enable = lib.mkDefault false;
      clean.extraArgs = lib.mkDefault "--keep 5 --keep-since 5d";
    };
  };
}
