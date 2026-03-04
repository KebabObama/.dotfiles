{
  programs.nvf.settings.vim = {
    luaConfigPost = ''
      local function set_transparency()
        local hl = vim.api.nvim_set_hl
        hl(0, "StatusLine",   { bg = "NONE" })
        hl(0, "StatusLineNC", { bg = "NONE" })
        hl(0, "NormalFloat",  { bg = "NONE" })
        hl(0, "FloatBorder",  { bg = "NONE" })
        hl(0, "WhichKeyNormal", { bg = "NONE" })
        hl(0, "WhichKeyFloat",  { bg = "NONE" })
        hl(0, "WhichKeyBorder", { bg = "NONE", fg = "#89b4fa" })
      end
      set_transparency()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_transparency,
      })
    '';
    luaConfigRC.buffer_utils = ''
      _G.close_buffer_keep_window = function()
        local current_buf = vim.api.nvim_get_current_buf()
        vim.cmd("bnext")
        if vim.api.nvim_get_current_buf() == current_buf then
          vim.cmd("enew")
        end
          pcall(vim.cmd, "bdelete " .. current_buf)
      end
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          })
        end,
      })
    '';
  };
}
