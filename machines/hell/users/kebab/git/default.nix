{config, ...}: {
  sops.secrets.github-token = {
    sopsFile = ./tokens.yaml;
  };

  home.sessionVariables = {
    GITHUB_USER = config.sops.secrets.github-token.path;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
      credential.helper = ''
        # bash
        case "$1" in
          get)
            echo "username=x-access-token"
            echo "password=$(cat ${config.sops.secrets.github-token.path})"
            ;;
        esac
      '';
    };
  };
}
