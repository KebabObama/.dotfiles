{
  programs.caelestia.settings.general = {
    persistence = true;
    apps = {
      terminal = ["kitty"];
      audio = [];
      playback = ["mpv"];
      explorer = ["yazi"];
    };
    idle = {
      lockBeforeSleep = true;
      inhibitWhenAudio = true;
      timeouts = [
        {
          timeout = 360;
          idleAction = "lock";
        }
        {
          timeout = 720;
          idleAction = [
            "systemctl"
            "suspend-then-hibernate"
          ];
        }
      ];
    };
  };
}
