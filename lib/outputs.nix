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

  apps.${configuration.system} =
    lib.mapAttrs' (host: _: {
      name = "install-${host}";
      value = {
        type = "app";
        meta.description = "Install ${host} using nixos-anywhere";
        program = let
          pkgs = nixpkgs.legacyPackages.${configuration.system};
          script = pkgs.writeShellScriptBin "install-${host}" ''
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
        in "${script}/bin/install-${host}";
      };
    })
    hostConfigs;
}
