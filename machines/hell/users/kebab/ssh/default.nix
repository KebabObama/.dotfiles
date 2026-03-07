{config, ...}: {
  sops.secrets = {
    final-boss.sopsFile = ./tokens.yaml;
  };
  programs.ssh.matchBlocks = {
    "final-boss" = {
      hostname = "138.68.88.160";
      user = "root";
      identityFile = config.sops.secrets.final-boss.path;
    };
  };
}
