{
  programs.nvf.settings.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      ts = {
        enable = true;
        format.type = ["biome" "prettier"];
        extensions.ts-error-translator.enable = true;
      };

      nix = {
        enable = true;
        lsp.servers = ["nixd"];
      };

      clang = {
        enable = true;
        cHeader = true;
        dap.enable = true;
      };

      astro = {
        enable = true;
        format.type = ["biome" "prettier"];
      };

      css = {
        enable = true;
        format.type = ["biome" "prettier"];
      };

      markdown = {
        enable = true;
        extraDiagnostics.enable = true;
        extensions.render-markdown-nvim.enable = true;
      };

      typst = {
        enable = true;
        extensions.typst-concealer.enable = true;
      };

      html.enable = true;
      java.enable = true;
      kotlin.enable = true;
      json.enable = true;
      go.enable = true;
      assembly.enable = true;
      csharp.enable = true;
      php.enable = true;
      qml.enable = true;
      bash.enable = true;
      lua.enable = true;
      sql.enable = true;
      tailwind.enable = true;
      python.enable = true;
      rust.enable = true;
    };
  };
}
