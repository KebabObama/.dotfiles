{
  user,
  stateVersion,
  lib,
  ...
}: {
  manual.html.enable = lib.mkDefault true;
  manual.manpages.enable = lib.mkDefault true;
  nixpkgs.config.allowUnfree = lib.mkDefault true;
  home = {
    inherit stateVersion;
    username = user;
    homeDirectory = "/home/${user}";
    preferXdgDirectories = lib.mkDefault true;
  };
}
