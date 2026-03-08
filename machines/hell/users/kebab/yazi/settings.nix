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

  open.prepand_rules = [
    {
      mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
      use = "extract";
    }
  ];

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

  manager = {
    ratio = [2 3 3];
    sort_by = "natural";
    sort_sensitive = true;
    sort_dir_first = true;
    sort_reverse = false;
    linemode = "permissions";
    show_hidden = true;
    show_symlink = true;
  };

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

  status = {
    separator_open = "";
    separator_close = "";
    separator_style.fg = "darkgray";
    separator_style.bg = "darkgray";
  };

  which = {
    sort_by = "key";
    sort_sensitive = false;
    sort_reverse = false;
  };

  input.cursor_blink = true;
  headsup.enabled = true;

  tasks = {
    micro_workers = 5;
    macro_workers = 10;
    bizarre_retry = 5;
    image_alloc = 536870912;
    image_bound = [0 0];
    suppress_preload = false;
  };
}
