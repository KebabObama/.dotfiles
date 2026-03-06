{inputs, ...}: {
  imports = [inputs.zen-browser.homeModules.default];

  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
    profiles.default = {
      isDefault = true;
      userChrome = builtins.readFile ./userChrome.css;
      settings = {
        "browser.ai.control.default" = "blocked";
        "browser.ai.control.linkPreviewKeyPoints" = "blocked";
        "browser.ai.control.pdfjsAltText" = "blocked";
        "browser.ai.control.sidebarChatbot" = "blocked";
        "browser.ai.control.smartTabGroups" = "blocked";
        "browser.ai.control.translations" = "blocked";
        "browser.aboutConfig.showWarning" = false;

        "accessibility.typeaheadfind.manual" = false;
        "accessibility.typeaheadfind" = false;
        "accessibility.typeaheadfind.flashBar" = false;
        "accessibility.typeaheadfind.casesensitive" = 0;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "sidebar.expandOnHover" = false;
        "reader.toolbar.vertical" = true;
        "sidebar.backupState" = ''{"command":"","panelOpen":false,"launcherExpanded":false,"launcherVisible":false}'';
        "sidebar.visibility" = "hide-sidebar";

        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.show-sidebar-and-toolbar-on-hover" = false;
        "zen.view.compact.toolbar-flash-popup" = false;
        "zen.tabs.show-newtab-vertical" = false;
        "zen.tabs.vertical.right-side" = true;
        "zen.tabs.vertical" = true;
        "zen.glance.enabled" = false;
        "zen.ctrlTab.show-pending-tabs" = false;
        "zen.folders.search.enabled" = true;
        "zen.folders.search.hover-delay" = 500;
      };
    };
  };
}
