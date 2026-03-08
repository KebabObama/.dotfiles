{
  user,
  stateVersion,
  lib,
  pkgs,
  ...
}: {
  manual.html.enable = lib.mkDefault true;
  manual.manpages.enable = lib.mkDefault true;
  home = {
    inherit stateVersion;
    username = user;
    homeDirectory = "/home/${user}";
    preferXdgDirectories = lib.mkDefault true;
    packages = with pkgs; [
      jq
    ];
  };
}
