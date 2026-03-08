{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = lib.mkIf config.programs.yazi.enable [pkgs.ouch];
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    theme = import ./theme.nix;
    keymap = import ./keymap.nix;
    settings = import ./settings.nix;
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
