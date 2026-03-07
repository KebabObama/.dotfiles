{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = true;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.default = {
      isDefault = true;
      userChrome = builtins.readFile ./userChrome.css;

      mods = [
        "2317fd93-c3ed-4f37-b55a-304c1816819e"
        "ae7868dc-1fa1-469e-8b89-a5edf7ab1f24"
        "253a3a74-0cc4-47b7-8b82-996a64f030d5"
      ];

      keyboardShortcuts = [
        {
          id = "zen-compact-mode-toggle";
          key = "s";
          modifiers.control = true;
        }
        {
          id = "key_quitApplication";
          disabled = true;
        }
      ];

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
        "reader.toolbar.vertical" = true;

        "sidebar.expandOnHover" = false;
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
