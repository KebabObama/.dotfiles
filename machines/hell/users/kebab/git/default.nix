{config, ...}: {
  sops.secrets.github-token = {
    sopsFile = ./tokens.yaml;
  };

  home.sessionVariables = {
    GITHUB_USER = config.sops.secrets.github-token.path;
  };

  programs.git = {
    enable = true;
    userName = "KebabaObama";
    userEmail = "lucaschyba@gmail.com";
    settings = {
      credential.helper = "!f() { echo \"password=$(cat ${config.sops.secrets.github-token.path})\"; }; f";
    };
  };
}
