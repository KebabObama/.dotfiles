{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (nixpkgs) lib;
  definitions = import ./definitions.nix {inherit self inputs;};
  functions = import ./functions.nix definitions lib;
  hostConfigs = functions.mkHostConfigs;
  pkgs = nixpkgs.legacyPackages.${definitions.system};
  installScripts = lib.mapAttrs (host: _: functions.mkInstallScript pkgs host) hostConfigs;
in {
  #################################
  # NixOS Configurations
  #################################

  nixosConfigurations = lib.mapAttrs (host: data: let
    args = definitions // {inherit functions host data;};
  in
    lib.nixosSystem {
      inherit (definitions) system;
      specialArgs = args;
      modules = functions.getNixosModules host ++ [{home-manager = functions.mkHmModule args;}];
    })
  hostConfigs;

  #################################
  # nix run commands
  #################################

  apps.${definitions.system} =
    functions.mkInstallApps definitions.system installScripts;
}
