{
  inputs,
  lib,
  ...
}: {
  imports = with inputs; [
    nix-gaming.nixosModules.platformOptimizations
    home-manager.nixosModules.home-manager
    aagl.nixosModules.default
  ];

  nix.settings = lib.mkMerge [
    (inputs.aagl.nixConfig or {})
    {
      max-jobs = lib.mkDefault "auto";
      cores = lib.mkDefault 0;
      auto-optimise-store = lib.mkDefault false;
      sandbox = lib.mkDefault true;
      require-sigs = lib.mkDefault true;
      experimental-features = lib.mkDefault ["nix-command" "flakes"];

      substituters = lib.mkDefault [
        "https://ezkea.cachix.org"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
      ];

      trusted-substituters = lib.mkDefault [
        "https://ezkea.cachix.org"
        "https://hyprland.cachix.org"
        "https://hydra.nixos.org/"
      ];

      trusted-public-keys = lib.mkDefault [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    }
  ];
}
