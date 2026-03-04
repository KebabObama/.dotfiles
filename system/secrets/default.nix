{
  inputs,
  data,
  lib,
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
in {
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
  users.groups.tokens.name = "tokens";

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
