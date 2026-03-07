{config, ...}: {
  sops.secrets.github-token = {
    sopsFile = ./tokens.yaml;
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      core.editor = "$EDITOR";
      url."https://github.com/".insteadOf = "github:";
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
      credential.helper = "!echo username=x-access-token; echo password=$(cat ${config.sops.secrets.github-token.path})";
    };
  };
}
