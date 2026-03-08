{
  config,
  lib,
  ...
}: let
  hosts = {
    "final-boss" = {
      hostname = "139.68.88.160";
      user = "root";
    };
  };
in {
  programs.ssh.matchBlocks =
    lib.mapAttrs
    (name: v: v // {identityFile = lib.mkDefault config.sops.secrets.${name}.path;})
    hosts;

  sops.secrets = lib.genAttrs (builtins.attrNames hosts) (_: {
    sopsFile = ./tokens.yaml;
  });
}
