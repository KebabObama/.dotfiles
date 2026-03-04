{
  programs.nvf.settings.vim = {
    statusline.lualine = {
      enable = true;
      theme = "auto";
      activeSection = {
        a = ["{ 'mode', icons_enabled = true }"];
        b = ["{ 'filetype', colored = true, icon_only = true, icon = { align = 'left' } }" "{ 'filename', symbols = {modified = ' ', readonly = ' '} }"];
        c = [''{ "diff", colored = false, diff_color = { added = 'DiffAdd',  modified = 'DiffChange', removed = 'DiffDelete', }, symbols = {added = '+', modified = '~', removed = '-'},} ''];
      };
      setupOpts = {
        options = {
          theme = {
            normal.c.bg = "NONE";
            insert.c.bg = "NONE";
            visual.c.bg = "NONE";
            replace.c.bg = "NONE";
            command.c.bg = "NONE";
            inactive.c.bg = "NONE";
          };
        };
      };
    };
    theme = {
      enable = true;
      name = "onedark";
      style = "deep";
      transparent = true;
    };
  };
}
