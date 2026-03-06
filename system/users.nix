{
  inputs,
  data,
  stateVersion,
  lib,
  config,
  pkgs,
  ...
}: let
  tokens = [
    "hell-rsa-pub"
    "github-token"
    "mail-token"
    "final-boss"
  ];

  users = data.users or [config.primaryUser];
  mkUser = u: {
    isNormalUser = true;
    description = u;
    extraGroups = lib.mkDefault ["docker" "wheel" "audio" "gamemode" "tokens" "networkmanager" "libvirtd" "kvm"];
    hashedPasswordFile = config.sops.secrets.${u}.path;
  };
in {
  imports = [inputs.sops-nix.nixosModules.sops];
  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = lib.mkDefault true;
  services.udisks2.enable = lib.mkDefault true;
  security.polkit.enable = lib.mkDefault true;
  environment = {
    systemPackages = with pkgs; [ntfs3g];
    sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
    sessionVariables.SOPS_AGE_SSH_PRIVATE_KEY_FILE = "/etc/ssh/ssh_host_ed25519_key";
  };
  users = {
    groups.tokens.name = "tokens";
    mutableUsers = lib.mkDefault false;
    defaultUserShell = lib.mkDefault pkgs.bash;
    users = lib.genAttrs users mkUser;
  };

  sops = {
    defaultSopsFile = lib.mkDefault ./secrets.yaml;

    age = {
      keyFile = lib.mkDefault "/var/lib/sops-nix/key.txt";
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      generateKey = false;
    };

    secrets = lib.mkMerge [
      (lib.genAttrs users (name: {
        key = name;
        sopsFile = ./secrets.yaml;
        neededForUsers = true;
      }))
      (lib.genAttrs tokens (name: {
        key = name;
        owner = config.primaryUser;
        group = "tokens";
        mode = "0600";
      }))
    ];
  };
}
