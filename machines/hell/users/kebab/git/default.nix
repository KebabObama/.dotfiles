{config, ...}: {
  sops.secrets.github-token = {
    sopsFile = ./tokens.yaml;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "KebabaObama";
      user.email = "lucaschyba@gmail.com";
      credential.helper = "!f() { if [ \"$1\" = \"get\" ]; then echo \"username=x-access-token\"; echo \"password=$(cat ${config.sops.secrets.github-token.path})\"; fi; }; f";
    };
  };
}
