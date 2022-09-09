{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = (with pkgs.vscode-extensions;
      [
        yzhang.markdown-all-in-one
        llvm-vs-code-extensions.vscode-clangd
        jnoortheen.nix-ide
      ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "highlight-trailing-white-spaces";
        publisher = "ybaumes";
        version = "0.0.2";
        sha256 = "sha256-wuF4ieegQmH8vjMHcoDYmGmR/qQKdeW5sDW83r7eGAY=";
      }
      {
        name = "json";
        publisher = "ZainChen";
        version = "2.0.2";
        sha256 = "sha256-nC3Q8KuCtn/jg1j/NaAxWGvnKe/ykrPm2PUjfsJz8aI=";
      }
      {
        name = "cyberpunk";
        publisher = "max-SS";
        version = "1.2.14";
        sha256 = "sha256-t5UAYRenHfM6BDyyMr+SGhrrdn1LZL7TuavtPyjOgWA=";
      }
      {
        name = "meson";
        publisher = "asabil";
        version = "1.3.0";
        sha256 = "sha256-QMp3dEFx6Mu5pgzklylW6b/ugYbtbT/qz8IeeuzPZeA=";
      }
      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.19";
        sha256 = "sha256-YyEr4XRI2zzkzDXX2oS+jVnm5dggoZcS4Vc8mNSuQpc=";
      }
      {
        name = "cppincludeguard";
        publisher = "akiramiyakoda";
        version = "1.6.0";
        sha256 = "sha256-YS5HuFTCF1xqSkCBzgFyECd3ncYMj/yjos6P3QNsSWE=";
      }
      {
        name = "cmantic";
        publisher = "tdennis4496";
        version = "0.9.0";
        sha256 = "sha256-bG4iNM1lLKoUWy0D+3z+zd+Vox+BcXEm/sdtcSQFYfY=";
      }
      {
        name = "doxdocgen";
        publisher = "cschlosser";
        version = "1.4.0";
        sha256 = "sha256-InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=";
      }
      {
        name = "rainbow-brackets";
        publisher = "2gua";
        version = "0.0.6";
        sha256 = "sha256-TVBvF/5KQVvWX1uHwZDlmvwGjOO5/lXbgVzB26U8rNQ=";
      }
      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }
      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "sha256-CFiva1AO/oHpszbpd7lLtDzbv1Yi55yQOQPP/kCTH4Y=";
      }
    ];

    userSettings =
      {
        # Editor
        "editor.fontLigatures" = true;
        "editor.fontFamily" = "Fira Code";
        "editor.find.autoFindInSelection" = "never";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;

        # Git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.autoStash" = true;

        # Plugins
        "clangd.checkUpdates" = true;
        "nix.enableLanguageServer" = true;
        "C/C++ Include Guard.Macro Type" = "filepath";
        "C/C++ Include Guard.Path Depth" = "2";
        "C/C++ Include Guard.Path Skip" = "1";
        "C/C++ Include Guard.Remove Extension" = "false";

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
