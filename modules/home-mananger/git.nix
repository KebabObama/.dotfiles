{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "KebabObama";
    userEmail = "lucaschyba@gmail.com";

    extraConfig = {
      init.defaultBranch = "master";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = [ pkgs.gh ];
}
