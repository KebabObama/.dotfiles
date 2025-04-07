{
  description = "My first flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zig.url = "github:mitchellh/zig-overlay";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      username = "kebab";
      host = "hell";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {

    nixosConfigurations = {
      ${host} = lib.nixosSystem {
        inherit system;
        modules = [
	  ./system/hardware-configuration.nix 
	  ./modules/nixos/default.nix 
	];
	specialArgs = { inherit self inputs username host; };
      };
    };

    #homeConfigurations = {
    #  kebab = inputs.home-manager.lib.homeManagerConfiguration {
    #    inherit pkgs;
    #    modules = [
    #      ./users/home.nix
	  #stylix.nixosModules.stylix
    #    ];
    #	specialArgs = { inherit self inputs username; };
    #  };
    #}; 
  };
}
