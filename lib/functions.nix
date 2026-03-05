{
  self ? toString ./..,
  staticHomeManager ? "home-manager",
  staticNixosSystem ? "system",
  userModulesTemplate ? "machines/<host>/users/<user>",
  hostModulesTemplate ? "machines/<host>/modules",
  ...
}: lib: rec {
  fill = template: props: let
    replacements = {
      "<host>" = props.host or "";
      "<user>" = props.user or "";
    };
  in
    lib.replaceStrings (lib.attrNames replacements) (lib.attrValues replacements) template;

  getPath = rel: self + "/${rel}";

  getDirs = dir:
    if !(builtins.pathExists dir)
    then []
    else lib.attrNames (lib.filterAttrs (_: type: type == "directory") (builtins.readDir dir));

  scanForModules = dir:
    if !(builtins.pathExists dir)
    then []
    else let
      contents = builtins.readDir dir;
    in
      lib.flatten (lib.mapAttrsToList (
          name: type: let
            path = dir + "/${name}";
          in
            if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix"
            then [path]
            else if type == "directory" && builtins.pathExists (path + "/default.nix")
            then [(path + "/default.nix")]
            else []
        )
        contents);

  mkHostConfigs = let
    hostBaseDir = lib.head (lib.splitString "/<host>" hostModulesTemplate);
    hosts = getDirs (getPath hostBaseDir);
  in
    lib.genAttrs hosts (hostname: rec {
      userParentDir = lib.head (lib.splitString "/<user>" (fill userModulesTemplate {host = hostname;}));
      users = getDirs (getPath userParentDir);
      primaryUser =
        if users != []
        then lib.head users
        else null;
    });

  mkInstallScript = pkgs: host:
    pkgs.writeShellScriptBin "install-${host}" ''
      # bash
      set -e
      echo "Starting installation for ${host}..."
      mkdir -p /tmp/sops-deploy/var/lib/sops-nix
      cp /var/lib/sops-nix/key.txt /tmp/sops-deploy/var/lib/sops-nix/key.txt
      ${pkgs.nixos-anywhere}/bin/nixos-anywhere \
        --copy-host-keys \
        --flake ".#${host}" \
        --build-on-remote \
        --extra-files /var \
        --ssh-option StrictHostKeyChecking=no \
        --ssh-option UserKnownHostsFile=/dev/null \
        -o StrictHostKeyChecking=no
        "$@"
      rm -rf /tmp/sops-deploy
    '';

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
