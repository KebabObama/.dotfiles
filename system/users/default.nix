{
  config,
  lib,
  pkgs,
  stateVersion,
  data,
  ...
}: let
  allUsers = data.users or [data.primaryUser];
  mkUser = u: {
    isNormalUser = true;
    description = u;
    extraGroups = lib.mkDefault ["docker" "wheel" "audio" "gamemode" "tokens" "networkmanager" "libvirtd" "kvm"];
    hashedPasswordFile = config.sops.secrets.${u}.path;
  };
in {
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
}
