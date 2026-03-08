{
  plugin.prepend_previewers = [
    {
      mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
      run = "ouch";
    }
  ];

  opener.extract = [
    {
      run = "ouch d -y \"$@\"";
      desc = "Extract here with ouch";
    }
  ];

  opener.mime = [
    {
      run = "xdg-open %s";
      desc = "Open using xdg-open";
    }
  ];

  open.append_rules = [];
  open.prepand_rules = [
    {
      mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
      use = "extract";
    }
  ];

  # Manager settings (main file list)
  mgr = {
    show_hidden = true;
    show_symlink = true;
    sort_by = "natural";
    sort_sensitive = true;
    sort_dir_first = true;
    sort_reverse = false;
    linemode = "permissions";
    scrolloff = 5;
  };

  # Layout configuration (superfile-like)
  manager = {
    ratio = [1 3 4]; # Sidebar ratio: parent, current, preview
    sort_by = "natural";
    sort_sensitive = true;
    sort_dir_first = true;
    sort_reverse = false;
    linemode = "permissions";
    show_hidden = true;
    show_symlink = true;
  };

  # Preview settings
  preview = {
    tab_size = 2;
    max_width = 1000;
    max_height = 1000;
    cache_dir = "";
    image_filter = "lanczos3";
    image_quality = 75;
    sixel_fraction = 15;
    ueberzug_scale = 1;
    ueberzug_offset = [0 0 0 0];
  };

  # Status bar (footer with metadata)
  status = {
    separator_open = "";
    separator_close = "";
    separator_style = {
      fg = "darkgray";
      bg = "darkgray";
    };
  };

  # Which-key menu settings
  which = {
    sort_by = "key";
    sort_sensitive = false;
    sort_reverse = false;
  };

  # Input settings
  input = {
    cursor_blink = true;
  };

  # Headsup display settings
  headsup = {
    enabled = true;
  };

  # Tasks display
  tasks = {
    micro_workers = 5;
    macro_workers = 10;
    bizarre_retry = 5;
    image_alloc = 536870912;
    image_bound = [0 0];
    suppress_preload = false;
  };
}
