{
  description = "Dynamic NixOS and Home Manager Flake";
  outputs = inputs: (import ./lib/outputs.nix inputs);

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    caelestia-nixpkgs.url = "github:nixos/nixpkgs/a82ccc39b39b621151d6732718e3e250109076fa";

    caelestia.url = "github:caelestia-dots/shell";
    caelestia.inputs.nixpkgs.follows = "caelestia-nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    wallpapers.url = "github:KebabObama/wallpapers";
    wallpapers.flake = false;

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    direnv-new.url = "github:KebabObama/direnv-new";
    direnv-new.inputs.nixpkgs.follows = "nixpkgs";

    virtuaverse-grub.url = "github:Patato777/dotfiles";
    virtuaverse-grub.flake = false;

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    viu.url = "github:KebabObama/viu";
    viu.inputs.nixpkgs.follows = "nixpkgs";
  };
}
