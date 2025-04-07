{ inputs, pkgs, ... }: {
  home.packages = (with pkgs; [
    ## CLI utility
    ani-cli
    binsider
    dconf-editor
    ffmpeg
    hexdump
    htop
    jq                                # JSON processor
    libnotify
    mimeo
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    nixd                              # nix lsp
    nixfmt-rfc-style                  # nix formatter
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    ripgrep                           # grep replacement
    shfmt                             # bash formatter
    swappy                            # snapshot editing tool
    treefmt                           # project formatter
    tldr
    unzip
    valgrind                          # c memory analyzer
    wavemon                           # monitoring for wireless network devices
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    woomer
    yt-dlp-light
    xdg-utils
    xxd

    ## CLI 
    cmatrix
    sl

    ## GUI Apps
    mission-center                    # GUI resources monitor

    # C / C++
    gcc
    gdb

    # Zig
    # inputs.zig.packages.${system}.master
    # zls

    # Python
    python3
    python312Packages.ipython

  ]);
}
