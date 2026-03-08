{
  manager = {
    cwd.fg = "#89b4fa";
    cwd.bold = true;

    find_keyword.fg = "#f38ba8";
    find_keyword.bold = true;

    find_position.fg = "#a6e3a1";
    find_position.bold = true;

    preview_hovered.underline = true;
    marker_copied = {fg = "#a6e3a1";};
    marker_cut = {fg = "#f38ba8";};
    marker_selected = {fg = "#89b4fa";};
    tab_inactive.fg = "#6c7086";
    border_symbol = "│";
    border_style.fg = "#313244";

    tab_active = {
      fg = "#1e1e2e";
      bg = "#89b4fa";
      bold = true;
    };
  };

  status = {
    separator_open = "";
    separator_close = "";

    mode_normal = {
      fg = "#1e1e2e";
      bg = "#89b4fa";
      bold = true;
    };
    mode_select = {
      fg = "#1e1e2e";
      bg = "#a6e3a1";
      bold = true;
    };
    mode_unset = {
      fg = "#1e1e2e";
      bg = "#f38ba8";
      bold = true;
    };

    progress_label.fg = "#cdd6f4";
    progress_label.bold = true;

    progress_normal.fg = "#89b4fa";
    progress_error.fg = "#f38ba8";

    permissions_t.fg = "#a6e3a1";
    permissions_r.fg = "#f9e2af";
    permissions_w.fg = "#f38ba8";
    permissions_x.fg = "#89b4fa";
    permissions_s.fg = "#6c7086";
  };

  input = {
    border.fg = "#313244";
    title.fg = "#89b4fa";
    title.bold = true;
    value.fg = "#cdd6f4";
    selected.fg = "#1e1e2e";
    selected.bg = "#89b4fa";
  };

  select = {
    border = {fg = "#313244";};
    active.fg = "#89b4fa";
    active.bold = true;
    inactive = {fg = "#6c7086";};
  };

  tasks = {
    border.fg = "#313244";
    title.fg = "#89b4fa";
    hovered.fg = "#1e1e2e";
    hovered.bg = "#89b4fa";
  };

  which = {
    mask = {};
    cand.fg = "#89b4fa";
    rest.fg = "#6c7086";
    desc.fg = "#cdd6f4";
    separator = " → ";
  };
}
