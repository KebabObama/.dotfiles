{config, ...}: {
  sops.secrets = {
    github-token.sopsFile = ./tokens.yaml;
    access-token.sopsFile = ./tokens.yaml;
  };

  home.sessionVariables = {
    GITHUB_TOKEN = "$(cat ${config.sops.secrets.github-token.path})";
  };

  nix.extraOptions = ''
    !include ${config.sops.secrets.access-token.path}
  '';

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      core.editor = "$EDITOR";
      url."https://github.com/".insteadOf = "github:";
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
    };
  };
}
