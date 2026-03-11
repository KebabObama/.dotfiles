{
  lib,
  data ? {},
  ...
}: {
  options = {
    preferSingleUser = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the host is intended for a single primary user.";
    };

    useInternalPackages = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to use internal packages for this host.";
    };

    users.primaryUser = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = data.firstUser or null;
      description = "Primary user for this host. If null, falls back to the first discovered user.";
    };
  };
}
