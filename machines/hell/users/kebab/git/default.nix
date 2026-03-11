{config, ...}: {
  sops = {
    secrets.github-token.sopsFile = ./tokens.yaml;
    templates."nix-github-token.conf".content = ''
      access-tokens = github.com=${config.sops.placeholder.github-token}
    '';
    templates."git-github-token.conf".content = ''
      https://x-access-token:${config.sops.placeholder.github-token}@github.com
    '';
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
      credential.helper = "store --file ${config.sops.templates."git-github-token.conf".path}";
    };
  };
}
