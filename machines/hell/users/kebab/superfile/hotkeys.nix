{
  programs.superfile.hotkeys = {
    #-- Basic Actions
    confirm = ["enter" "right" ""];
    quit = ["q"];
    cd_quit = ["Q" ""];

    #-- Navigation
    list_up = ["k" "up" ""];
    list_down = ["j" "down" ""];
    page_up = ["pgup" ""];
    page_down = ["pgdown" ""];

    #-- File Panel Controls
    create_new_file_panel = ["t" ""];
    close_file_panel = ["q" ""];
    next_file_panel = ["tab" ""];
    previous_file_panel = ["shift+tab" ""];
    toggle_file_preview_panel = ["f" ""];
    open_sort_options_menu = ["o" ""];
    toggle_reverse_sort = ["R" ""];

    #-- Focus Manipulation
    focus_on_process_bar = ["ctrl+p" ""];
    focus_on_sidebar = ["ctrl+s" ""];
    focus_on_metadata = ["ctrl+d" ""];
    toggle_footer = ["ctrl+f" ""];

    #-- File/Dir Creation/Renaming
    file_panel_item_create = ["a" ""];
    file_panel_item_rename = ["r" ""];

    #-- Main File Operations
    copy_items = ["y" ""];
    cut_items = ["x" ""];
    paste_items = ["p" ""];
    delete_items = ["d" ""];
    permanently_delete_items = ["D" ""];

    #-- Archive Manipulation
    extract_file = ["ctrl+e" ""];
    compress_file = ["ctrl+a" ""];

    #-- Editor Actions
    open_file_with_editor = ["e" ""];
    open_current_directory_with_editor = ["E" ""];

    #-- Other Actions
    pinned_directory = ["P" ""];
    toggle_dot_file = ["." ""];
    change_panel_mode = ["v" ""];
    open_help_menu = ["?" ""];
    open_spf_prompt = [">" ""];
    open_command_line = [":" ""];
    open_zoxide = ["z" ""];
    copy_path = ["Y" ""];
    copy_present_working_directory = ["c" ""];

    ###############################################################################
    #                                Typing hotkeys                               #
    ###############################################################################

    # Note: These hotkeys can override all hotkeys.

    confirm_typing = ["enter" ""];
    cancel_typing = ["esc" ""];

    ###############################################################################
    #                            Mode-Specific Hotkeys                            #
    ###############################################################################

    #-- Normal Mode Actions
    parent_directory = ["-" "h" "left"];
    search_bar = ["/" ""];

    #-- Selection Mode Actions
    file_panel_select_mode_items_select_down = ["J" ""];
    file_panel_select_mode_items_select_up = ["K" ""];
    file_panel_select_all_items = ["A" ""];
  };
}
