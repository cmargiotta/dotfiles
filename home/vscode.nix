{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = map
      (extension: pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          inherit (extension) name publisher version sha256;
        };
      })
      (import ./vscode-extensions.nix).extensions;

    userSettings =
      {
        # Editor
        "editor.fontLigatures" = true;
        "editor.fontFamily" = "Fira Code";
        "editor.find.autoFindInSelection" = "never";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.inlayHints.enabled" = false;

        # Git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.autoStash" = true;

        # Plugins
        "clangd.checkUpdates" = true;
        "nix.enableLanguageServer" = true;
        "C/C++ Include Guard.Macro Type" = "Filepath";
        "C/C++ Include Guard.Path Depth" = "2";
        "C/C++ Include Guard.Path Skip" = "1";
        "C/C++ Include Guard.Remove Extension" = false;
        "mesonbuild.buildFolder" = "build";
        "mesonbuild.configureOnOpen" = true;
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };

        # Preferences
        "explorer.confirmDragAndDrop" = false;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "search.smartCase" = true;
        "extensions.autoUpdate" = false;
        "extensions.ignoreRecommendations" = true;
        "terminal.external.linuxExec" = "kitty";
        "telemetry.telemetryLevel" = "off";
        "workbench.colorTheme" = "Cyberpunk";
      };
  };
}
