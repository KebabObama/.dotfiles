{pkgs, ...}: {
  programs.caelestia.systemd = {
    enable = true;
    target = "graphical-session.target";
    environment = [];
  };

  systemd.user.services.caelestia-autolock = {
    Install.WantedBy = ["caelestia.service"];
    Unit = {
      Description = "Lock for Caelestia Startup";
      After = ["caelestia.service"];
      BindsTo = ["caelestia.service"];
    };

    Service = {
      Type = "oneshot";
      RemainAfterExit = false;
      ExecStart = pkgs.writeShellScript "caelestia-lock-fix" ''
        # bash
        sleep 0.25
        for i in {1..5}; do
          if caelestia-shell ipc call lock lock; then
            exit 0
          fi
          sleep 0.25
        done
        exit 1
      '';
    };
  };
}
