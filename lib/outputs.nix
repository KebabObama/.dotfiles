{
  self,
  nixpkgs,
  home-manager,
  ...
} @ inputs: let
  inherit (nixpkgs) lib;
  definitions = import ./definitions.nix {inherit self inputs;};
  functions = import ./functions.nix definitions lib;
  hostConfigs = functions.mkHostConfigs;
  pkgs = nixpkgs.legacyPackages.${definitions.system};
in {
  # --- NixOS Configurations ---
  nixosConfigurations = lib.mapAttrs (host: data:
    lib.nixosSystem {
      inherit (definitions) system;
      specialArgs = definitions // {inherit functions host data;};
      modules = functions.getNixosModules host;
    })
  hostConfigs;

  # --- Home Manager Configurations ---
  homeConfigurations = lib.listToAttrs (lib.concatLists (lib.mapAttrsToList (host: data:
    map (user: {
      name = "${user}@${host}";
      value = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${definitions.system};
        extraSpecialArgs = definitions // {inherit functions host data user;};
        modules = functions.getHomeModules host user;
      };
    })
    data.users)
  hostConfigs));

  # --- Install Scripts ---
  apps.${definitions.system} =
    lib.mapAttrs' (host: _: {
      name = "install-${host}";
      value = {
        type = "app";
        meta.description = ''Install host "${host}" using nixos-anywhere to another device.'';
        program = "${(functions.mkInstallScript pkgs host)}/bin/install-${host}";
      };
    })
    hostConfigs;
}
