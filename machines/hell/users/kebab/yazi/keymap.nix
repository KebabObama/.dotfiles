{
  programs.yazi.keymap = {
    mgr.prepend_keymap = [
      # Vim-like navigation
      {
        on = ["h"];
        run = "leave";
        desc = "Go to parent directory";
      }
      {
        on = ["j"];
        run = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = ["k"];
        run = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = ["l"];
        run = "enter";
        desc = "Enter directory or open file";
      }

      # Jumping keys
      {
        on = ["g" "g"];
        run = "arrow_to 0";
        desc = "Jump to start";
      }
      {
        on = ["G"];
        run = "arrow_to -1";
        desc = "Jump to end";
      }

      # Page navigation
      {
        on = ["ctrl" "b"];
        run = "arrow -50%";
        desc = "Page up";
      }
      {
        on = ["ctrl" "f"];
        run = "arrow 50%";
        desc = "Page down";
      }
      {
        on = ["ctrl" "u"];
        run = "arrow -50%";
        desc = "Half page up";
      }
      {
        on = ["ctrl" "d"];
        run = "arrow 50%";
        desc = "Half page down";
      }

      # File operations
      {
        on = ["y"];
        run = "yank";
        desc = "Copy selected files";
      }
      {
        on = ["d"];
        run = "remove";
        desc = "Move to trash";
      }
      {
        on = ["D"];
        run = "remove --permanently";
        desc = "Delete permanently";
      }
      {
        on = ["p"];
        run = "paste";
        desc = "Paste files";
      }
      # Selection
      {
        on = ["ctrl" "a"];
        run = "select_all";
        desc = "Select all files";
      }

      # File interaction
      {
        on = ["o"];
        run = "open";
        desc = "Open file with default application";
      }
      {
        on = ["e"];
        run = "open --interactive";
        desc = "Open with interactive app selection";
      }

      # Archive operations
      {
        on = ["C"];
        run = "plugin ouch";
        desc = "Compress with ouch";
      }

      # Search and filter
      {
        on = ["/"];
        run = "find --smart-enter";
        desc = "Find with fuzzy search";
      }
      {
        on = ["?"];
        run = "help";
        desc = "Show help and keybindings";
      }
      {
        on = ["f"];
        run = "filter";
        desc = "Filter files";
      }
      {
        on = ["ctrl" "s"];
        run = "plugin smart-filter";
        desc = "Smart filter";
      }

      # Creation and renaming
      {
        on = ["a"];
        run = "create";
        desc = "Create new file";
      }
      {
        on = ["i"];
        run = "rename";
        desc = "Rename selected file";
      }

      # Undo/Redo
      {
        on = ["u"];
        run = "undo";
        desc = "Undo last action";
      }
      {
        on = ["U"];
        run = "redo";
        desc = "Redo last action";
      }

      # Sorting (vim-inspired)
      {
        on = ["s" "n"];
        run = "sort none";
        desc = "Sort by name";
      }
      {
        on = ["s" "m"];
        run = "sort modified";
        desc = "Sort by modified time";
      }
      {
        on = ["s" "s"];
        run = "sort size";
        desc = "Sort by size";
      }

      # Toggle options
      {
        on = ["s" "h"];
        run = "toggle hidden";
        desc = "Toggle hidden files";
      }

      # Mount points
      {
        on = ["m"];
        run = "plugin mount";
        desc = "Show mount points";
      }
    ];
  };
}
