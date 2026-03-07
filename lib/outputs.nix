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

  nixosConfigurations =
    lib.mapAttrs
    (host: data:
      lib.nixosSystem {
        inherit (definitions) system;
        specialArgs = definitions // {inherit functions host data;};
        modules =
          functions.getNixosModules host
          ++ [
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = definitions // {inherit functions host data;};
                users = lib.genAttrs data.users (
                  user: {
                    imports = functions.getHomeModules host user;
                    _module.args = {inherit user host data functions;};
                  }
                );
              };
            }
          ];
      })
    hostConfigs;

  #################################
  # nix run commands
  #################################

  apps.${definitions.system} =
    (functions.mkInstallApps definitions.system installScripts)
    // {
      default = {
        type = "app";
        program = "${(functions.mkRebuild pkgs self)}/bin/rebuild";
      };
    };
}
