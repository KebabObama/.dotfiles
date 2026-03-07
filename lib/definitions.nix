args:
args
// {
  stateVersion = "26.05";
  system = "x86_64-linux";
  staticHomeManager = "home-manager";
  staticNixosSystem = "system";
  userModulesTemplate = "machines/<host>/users/<user>";
  hostModulesTemplate = "machines/<host>/modules";
}
