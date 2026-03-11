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
    then lib.attrNames (lib.filterAttrs (_: type: type == "directory") (builtins.readDir dir))
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
      userParentDir = lib.head (lib.splitString "/<user>" (fill userModulesTemplate {host = hostname;}));
      users = getDirs (getPath userParentDir);
      firstUser = assert builtins.length users > 0; lib.head users;
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

  mkHmModule = args: {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = args;
    users = lib.genAttrs args.data.users (user: {
      imports = getHomeModules args.host user;
      _module.args = args // {inherit user;};
    });
  };

  getNixosModules = host:
    scanForModules (getPath staticNixosSystem) ++ scanForModules (getPath (fill hostModulesTemplate {inherit host;}));

  getHomeModules = host: user:
    scanForModules (getPath staticHomeManager) ++ scanForModules (getPath (fill userModulesTemplate {inherit host user;}));
}
