{pkgs, ...}: {
  home.packages = with pkgs; [blesh];
  programs = {
    nix-index-database.comma.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      package = pkgs.zoxide;
    };

    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      new.enable = true;
    };

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        v = "vi";
      };
      shellOptions = ["extglob" "globstar" "histappend" "checkwinsize"];
      initExtra = ''
        # bash
        source "$HOME/.profile"
        if [[ "$TERM_PROGRAM" != "vscode" ]]; then
          source "${pkgs.blesh}/share/blesh/ble.sh"
          ble-import -f integration/zoxide
          bleopt complete_menu_style=desc menu_desc_multicolumn_width=999
          [ -f "$HOME/.local/state/caelestia/sequences.txt" ] && \
            cat "$HOME/.local/state/caelestia/sequences.txt"
        fi
      '';
    };
  };
}
