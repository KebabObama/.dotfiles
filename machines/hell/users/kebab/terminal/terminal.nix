{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = 0.8;
      cursor_shape = "beam";
      scrollback_lines = 2000;
      window_padding_width = 05;
      enable_audio_bell = false;
      mouse_hide_wait = 30;
      dynamic_background_opacity = true;
      allow_remote_control = true;
      hide_window_decorations = false;
      cursor_trail = 15;
      scrollbar = "hovered";
      strip_trailing_spaces = "smart";
      scrollback_pager = ''vim -c "setlocal noreadonly buftype=nofile noswapfile" -c "$" -'';
    };

    shellIntegration = {
      mode = "no-prompt no-rc no-cursor";
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    keybindings = {
      "ctrl+t" = "new_tab";
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+w" = "close_tab";
      "ctrl+tab" = "next_tab";
      "ctrl+shift+tab" = "previous_tab";
      "ctrl+1" = "goto_tab 1";
      "ctrl+2" = "goto_tab 2";
      "ctrl+3" = "goto_tab 3";
      "ctrl+4" = "goto_tab 4";
      "ctrl+5" = "goto_tab 5";
      "ctrl+6" = "goto_tab 6";
      "ctrl+7" = "goto_tab 7";
      "ctrl+8" = "goto_tab 8";
      "ctrl+9" = "goto_tab 9";
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";
      "ctrl+shift+r" = "reload_config";
      "ctrl+=" = "increase_font_size";
      "ctrl+-" = "decrease_font_size";
      "ctrl+0" = "restore_font_size";
      "ctrl+f" = "show_scrollback";
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+x" = "clear_selection";
      "ctrl+backspace" = "send_text all \\x17";
      "ctrl+delete" = "send_text all \\x1bd";
      "ctrl+q" = "";
    };
  };
}
