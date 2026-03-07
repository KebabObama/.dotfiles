{config, ...}: {
  sops.secrets.github-token = {
    sopsFile = ./tokens.yaml;
  };

  home.sessionVariables = {
    GITHUB_TOKEN = "$(cat ${config.sops.secrets.github-token.path})";
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      core.editor = "$EDITOR";
      url."https://github.com/".insteadOf = "github:";
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
      # credential.helper = "!f() { if [ \"$1\" = \"get\" ]; then echo \"username=x-access-token\"; echo \"password=$(cat ${config.sops.secrets.github-token.path})\"; fi; }; f";
    };
  };
}
