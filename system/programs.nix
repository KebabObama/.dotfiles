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
  environment.systemPackages = with pkgs; [
    inputs.disko.packages.${stdenv.hostPlatform.system}.default
    wget
    curl
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
        credential."https://github.com".helper = lib.mkDefault credentialScript;
        url."https://github.com/".insteadOf = lib.mkDefault ["github:"];
      };
    };

    vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      package = lib.mkDefault pkgs.vim-full;
    };
  };
}
