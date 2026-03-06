{lib, ...}: {
  time.timeZone = lib.mkDefault "Europe/Prague";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LANGUAGE = lib.mkDefault "en_US.UTF-8";
    LC_ALL = lib.mkDefault "en_US.UTF-8";
    LC_CTYPE = lib.mkDefault "en_US.UTF-8";
    LC_COLLATE = lib.mkDefault "en_US.UTF-8";
    LC_MESSAGES = lib.mkDefault "en_US.UTF-8";
    LC_ADDRESS = lib.mkDefault "en_US.UTF-8";
    LC_IDENTIFICATION = lib.mkDefault "en_US.UTF-8";
    LC_MEASUREMENT = lib.mkDefault "en_US.UTF-8";
    LC_MONETARY = lib.mkDefault "en_US.UTF-8";
    LC_NAME = lib.mkDefault "en_US.UTF-8";
    LC_NUMERIC = lib.mkDefault "en_US.UTF-8";
    LC_PAPER = lib.mkDefault "en_US.UTF-8";
    LC_TELEPHONE = lib.mkDefault "en_US.UTF-8";
    LC_TIME = lib.mkDefault "en_US.UTF-8";
  };
  console.keyMap = lib.mkDefault "cz-qwertz";
  services.xserver.xkb = {
    layout = "cz";
    variant = "";
  };
}
