{pkgs, ...}: {
  imports = [
    ./settings.nix
    ./keymap.nix
  ];

  home.packages = [pkgs.ouch];

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    plugins = with pkgs.yaziPlugins; {
      inherit smart-paste;
      inherit wl-clipboard;
      inherit git;
      inherit smart-filter;
      inherit ouch;
      inherit restore;
      inherit mime-ext;
      inherit rich-preview;
      inherit smart-enter;
      inherit sudo;
      inherit mount;
      inherit chmod;
      inherit bookmarks;
    };
  };
}
