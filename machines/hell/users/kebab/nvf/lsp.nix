{
  programs.nvf.settings.vim = {
    diagnostics = {
      enable = true;
      config = {
        update_in_insert = true;
        virtual_text = true;
        virtual_lines = false;
      };
    };

    lsp = {
      enable = true;
      lspkind.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      harper-ls.enable = true;
      harper-ls.settings = {
        codeActions.ForceStable = false;
        languageConfigs = {
          cs = true;
        };
        diagnosticSeverity = "hint";
        dialect = "American";
        fileDictPath = "";
        ignoredLintsPath = {};
        isolateEnglish = false;
        markdown.IgnoreLinkTitle = false;
        maxFileLength = 120000;
        linters = {
          BoringWords = true;
          PossessiveNoun = true;
          SentenceCapitalization = false;
          SpellCheck = true;
        };
      };
      lspSignature.enable = true;
      lspconfig.enable = true;
      otter-nvim.enable = true;
      lspsaga = {
        enable = true;
        setupOpts = {
          symbol_in_winbar.enable = false;
          lightbulb = {
            enable = false;
            sign = false;
            virtual_text = false;
          };
        };
      };
      trouble = {
        enable = true;
        mappings = {
          lspReferences = null;
          symbols = null;
          workspaceDiagnostics = null;
          documentDiagnostics = "<leader>xd";
        };
      };
    };
  };
}
