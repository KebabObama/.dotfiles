{
  inputs,
  data,
  stateVersion,
  lib,
  config,
  pkgs,
  self,
  host,
  hostModulesTemplate,
  ...
}: let
  users = data.users or [config.users.primaryUser];
  hostTemplate = toString (lib.head (lib.splitString "/<host>" hostModulesTemplate));
  mkUser = user: {
    isNormalUser = lib.mkDefault true;
    description = lib.mkDefault user;
    extraGroups = lib.mkDefault ["docker" "wheel" "audio" "gamemode" "tokens" "networkmanager" "libvirtd" "kvm"];
    hashedPasswordFile = config.sops.secrets.${user}.path;
  };
in {
  imports = [inputs.sops-nix.nixosModules.sops];

  system.stateVersion = stateVersion;
  system.activationScripts.sopsAgeKey = {
    deps = ["users" "groups"];
    text = ''
      globalKeyFile=/var/lib/sops-nix/key.txt
      if [ ! -f "$globalKeyFile" ]; then
        mkdir -p /var/lib/sops-nix
        chmod 700 /var/lib/sops-nix
        ${pkgs.ssh-to-age}/bin/ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key > "$globalKeyFile"
        chmod 600 "$globalKeyFile"
      fi
      ${lib.concatMapStringsSep "\n" (user: let
          userHome = config.users.users.${user}.home;
          userGroup = config.users.users.${user}.group;
        in ''
          userConfigDir="${userHome}/.config/sops/age"
          if [ -d "${userHome}" ]; then
            mkdir -p "$userConfigDir"
            mkdir -p /home/jitka/.config/dconf
            cp "$globalKeyFile" "$userConfigDir/keys.txt"
            chown -R ${user}:${userGroup} "${userHome}/.config/"
            chmod -R 700 "${userHome}/.config/"
            chmod -R 600 "$userConfigDir/keys.txt"
          fi
        '')
        users}
    '';
  };

  nixpkgs.config.allowUnfree = lib.mkDefault true;
  services.udisks2.enable = lib.mkDefault true;

  users = {
    groups.tokens.name = "tokens";
    mutableUsers = lib.mkDefault false;
    defaultUserShell = lib.mkDefault pkgs.bash;
    users = lib.genAttrs users mkUser;
  };

  sops = {
    defaultSopsFile = lib.mkDefault "${self.outPath}/${hostTemplate}/${host}/secrets.yaml";
    age = {
      keyFile = null;
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      generateKey = false;
    };

    secrets = lib.genAttrs users (name: {
      key = name;
      neededForUsers = true;
    });
  };
}
