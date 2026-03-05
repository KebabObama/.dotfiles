{
  self,
  nixpkgs,
  home-manager,
  ...
} @ inputs: let
  inherit (nixpkgs) lib;
  configuration = import ./configurations.nix {inherit self inputs;};
  functions = import ./functions.nix configuration lib;
  hostConfigs = functions.mkHostConfigs;
  pkgs = nixpkgs.legacyPackages.${configuration.system};
in {
  # --- NixOS Configurations ---
  nixosConfigurations = lib.mapAttrs (host: data:
    lib.nixosSystem {
      inherit (configuration) system;
      specialArgs = configuration // {inherit functions host data;};
      modules = functions.getNixosModules host;
    })
  hostConfigs;

  # --- Home Manager Configurations ---
  homeConfigurations = lib.listToAttrs (lib.concatLists (lib.mapAttrsToList (host: data:
    map (user: {
      name = "${user}@${host}";
      value = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${configuration.system};
        extraSpecialArgs = configuration // {inherit functions host data user;};
        modules = functions.getHomeModules host user;
      };
    })
    data.users)
  hostConfigs));

  # --- Install Scripts ---
  apps.${configuration.system} =
    lib.mapAttrs' (host: _: {
      name = "install-${host}";
      value = {
        type = "app";
        meta.description = "Install ${host} using nixos-anywhere";
        program = "${(functions.mkInstallScript pkgs host)}/bin/install-${host}";
      };
    })
    hostConfigs;
}
