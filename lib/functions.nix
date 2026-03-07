{
  self ? toString ./..,
  staticHomeManager ? "home-manager",
  staticNixosSystem ? "system",
  userModulesTemplate ? "machines/<host>/users/<user>",
  hostModulesTemplate ? "machines/<host>/modules",
  ...
}: lib: rec {
  fill = template: props: let
    replacements."<host>" = props.host or "";
    replacements."<user>" = props.user or "";
  in
    lib.replaceStrings
    (lib.attrNames replacements)
    (lib.attrValues replacements)
    template;

  getPath = rel: self + "/${rel}";

  getDirs = dir:
    if (builtins.pathExists dir)
    then
      lib.attrNames
      (lib.filterAttrs (_: type: type == "directory") (builtins.readDir dir))
    else [];

  scanForModules = dir:
    assert (builtins.pathExists dir);
      lib.flatten
      (lib.mapAttrsToList
        (
          name: type: let
            path = dir + "/${name}";
          in
            if type == "regular" && lib.hasSuffix ".nix" name
            then [path]
            else if type == "directory" && builtins.pathExists (path + "/default.nix")
            then [(path + "/default.nix")]
            else []
        )
        (builtins.readDir dir));

  mkHostConfigs =
    lib.genAttrs
    (getDirs (getPath (lib.head (lib.splitString "/<host>" hostModulesTemplate))))
    (hostname: rec {
      userParentDir =
        lib.head (lib.splitString "/<user>" (fill userModulesTemplate {host = hostname;}));

      users = getDirs (getPath userParentDir);

      firstUser = assert builtins.length users > 0;
        lib.head users;
    });

  mkInstallScript = pkgs: host:
    pkgs.writeShellScriptBin "install-${host}" ''
      set -e
      echo "Starting installation for ${host}..."
      ${pkgs.nixos-anywhere}/bin/nixos-anywhere \
        --copy-host-keys \
        --flake ".#${host}" \
        --build-on-remote \
        "$@"
    '';

  mkRebuild = pkgs:
    pkgs.writeShellApplication {
      name = "rebuild";
      meta.description = "Rebuild hosts.";
      runtimeInputs = with pkgs; [
        nixos-rebuild
        coreutils
        hostname
      ];
      text = ''
        # bash
        MODE="switch"
        HOST="$(hostname)"
        if [ $# -ge 1 ]; then
          case "$1" in
            switch|boot|test|build|dry-build|dry-activate)
              MODE="$1"; shift;;
          esac
        fi
        if [ $# -gt 0 ] && [[ ! "$1" =~ ^- ]]; then
          HOST="$1"
          shift
        fi
        echo "Rebuilding host: $HOST (mode: $MODE)"
        exec sudo nixos-rebuild "$MODE" --flake "$HOME/.dotfiles#$HOST" "$@"
      '';
    };

  mkInstallApps = _: installScripts:
    lib.mapAttrs'
    (host: _: {
      name = "install-${host}";
      value = {
        type = "app";
        meta.description = "Run the installation script for ${host}.";
        program = "${installScripts.${host}}/bin/install-${host}";
      };
    })
    installScripts;

  mkScriptPkgs = pkgs: dir:
    lib.pipe (builtins.readDir dir) [
      (lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".sh" name))
      (lib.mapAttrsToList (
        name: _: pkgs.writeScriptBin (lib.removeSuffix ".sh" name) (builtins.readFile (dir + "/${name}"))
      ))
    ];

  getNixosModules = host:
    scanForModules (getPath staticNixosSystem) ++ scanForModules (getPath (fill hostModulesTemplate {inherit host;}));

  getHomeModules = host: user:
    scanForModules (getPath staticHomeManager) ++ scanForModules (getPath (fill userModulesTemplate {inherit host user;}));
}
