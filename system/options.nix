{lib, ...}: {
  options.preferSingleUser = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether the host is intended for a single primary user.";
  };
}
