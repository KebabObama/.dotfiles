{config, ...}: {
  sops = {
    secrets.github-token.sopsFile = ./tokens.yaml;
    templates = {
      "nix-github-token.conf".content = ''
        access-tokens = github.com=${config.sops.placeholder.github-token}
      '';
      "git-github-token.conf".content = ''
        username=x-access-token
        password=${config.sops.placeholder.github-token}
      '';
    };
  };

  nix.extraOptions = ''
    !include ${config.sops.templates."nix-github-token.conf".path}
  '';

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      core.editor = "$EDITOR";
      url."https://github.com/".insteadOf = "github:";
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
      credential.helper = ''!cat ${config.sops.templates."git-github-token.conf".path}'';
    };
  };
}
