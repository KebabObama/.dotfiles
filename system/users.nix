{
  inputs,
  data,
  stateVersion,
  lib,
  config,
  pkgs,
  ...
}: let
  passwords =
    lib.genAttrs
    (data.users or [data.primaryUser])
    (username: {
      key = username;
      sopsFile = ./users.yaml;
      neededForUsers = true;
    });

  tokens = [
    "hell-rsa-pub"
    "github-token"
    "mail-token"
    "final-boss"
  ];

  allUsers = data.users or [data.primaryUser];
  mkUser = u: {
    isNormalUser = true;
    description = u;
    extraGroups = lib.mkDefault ["docker" "wheel" "audio" "gamemode" "tokens" "networkmanager" "libvirtd" "kvm"];
    hashedPasswordFile = config.sops.secrets.${u}.path;
  };
in {
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
  users.groups.tokens.name = "tokens";
  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = lib.mkDefault true;
  services.udisks2.enable = lib.mkDefault true;
  security.polkit.enable = lib.mkDefault true;
  environment.systemPackages = with pkgs; [ntfs3g];
  users = {
    mutableUsers = lib.mkDefault false;
    defaultUserShell = lib.mkDefault pkgs.bash;
    users = lib.genAttrs allUsers mkUser;
  };

  sops = {
    defaultSopsFile = lib.mkDefault ./tokens.yaml;

    age = {
      keyFile = lib.mkDefault "/var/lib/sops-nix/key.txt";
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      generateKey = false;
    };

    secrets = lib.mkMerge [
      passwords
      (lib.genAttrs tokens (name: {
        key = name;
        owner = data.primaryUser;
        group = "tokens";
        mode = "0600";
      }))
    ];
  };
}
