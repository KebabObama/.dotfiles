{pkgs, ...}: {
  programs.aerc = {
    enable = true;
    extraConfig = {
      general.unsafe-accounts-conf = true;
      compose.editor = "vim";
      filters = {
        "text/plain" = "colorize";
        "text/calendar" = "calendar";
        "text/html" = "html | colorize";
        "message/delivery-status" = "colorize";
        "message/rfc822" = "colorize";
        "application/pdf" = "vim";
      };
    };
  };
  services.imapnotify.enable = true;
  accounts.email.accounts = {
    personal = {
      primary = true;
      address = "lucaschyba@gmail.com";
      userName = "lucaschyba@gmail.com";
      realName = "Lukáš Pražák";
      passwordCommand = "${pkgs.coreutils}/bin/cat /run/secrets/mail-token";
      aerc.enable = true;

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
        tls.enable = true;
        tls.useStartTls = true;
      };

      imap = {
        host = "imap.gmail.com";
        port = 993;
      };

      imapnotify = {
        enable = true;
        boxes = ["INBOX"];
        onNotify = "${pkgs.libnotify}/bin/notify-send 'New Mail' 'You have a new message in your inbox'";
      };
    };
  };
}
