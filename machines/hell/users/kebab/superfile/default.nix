{config, ...}: {
  imports = [
    ./settings.nix
    ./hotkeys.nix
  ];

  programs.superfile = {
    enable = false;

    pinnedFolders = [
      {
        name = "Projects";
        location = "${config.home.homeDirectory}/projects";
      }
      {
        name = "Dotfiles";
        location = "${config.home.homeDirectory}/.dotfiles";
      }
    ];
  };
}
