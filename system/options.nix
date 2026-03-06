{
  lib,
  data ? {},
  ...
}: {
  options.preferSingleUser = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether the host is intended for a single primary user.";
  };

  options.primaryUser = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = data.primaryUser or null;
    description = "Primary user for this host. If null, falls back to the first discovered user.";
  };
}
