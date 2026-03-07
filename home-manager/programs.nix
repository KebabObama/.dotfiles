{
  lib,
  inputs,
  user,
  ...
}: {
  imports = with inputs; [
    direnv-new.homeManagerModules.default
    sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = lib.mkDefault false;
      silent = lib.mkDefault true;
      nix-direnv.enable = lib.mkDefault true;
      new.enable = lib.mkDefault true;
      stdlib = lib.mkBefore ''
        : ''${XDG_CACHE_HOME:=$HOME/.cache}
        _get_layout_dir() {
          local hash=$(echo -n "$PWD" | sha256sum | cut -c-7)
          echo "$XDG_CACHE_HOME/direnv/layouts/''${PWD##*/}-$hash"
        }
        export direnv_layout_dir=$(_get_layout_dir)
      '';
      config = {
        global.log_format = lib.mkDefault "";
        global.hide_env_diff = lib.mkDefault true;
      };
    };

    ssh = {
      enable = lib.mkDefault true;
      enableDefaultConfig = lib.mkDefault false;
      matchBlocks."*" = lib.mkDefault {};
    };
  };
}
