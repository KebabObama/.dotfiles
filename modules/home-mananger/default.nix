{inputs, username, host, ...}: {
  imports = [
    ./browser.nix                     # Firefox
    ./fzf.nix                         # fuzzy finder
    ./git.nix                         # version control
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./nvim.nix                        # neovim editor
    ./packages.nix                    # other packages
    ./starship.nix                    # shell prompt
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./waybar                          # status bar
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
  ];
}
