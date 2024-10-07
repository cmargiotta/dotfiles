{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages =
      epkgs:
        with epkgs;
        [
          beacon
          cape
          centaur-tabs
          colorful-mode
          compiler-explorer
          consult
          corfu
          dap-mode
          dashboard
          dim
          dockerfile-mode
          elisp-autofmt
          embark
          embark-consult
          envrc
          esh-autosuggest
          expand-region
          flycheck
          flycheck-clang-tidy
          flycheck-projectile
          flycheck-rust
          git-modes
          git-timemachine
          hide-mode-line
          hl-todo
          kanagawa-theme
          ligature
          link-hint
          lsp-mode
          lsp-treemacs
          lsp-ui
          magit
          magit-lfs
          magit-todos
          marginalia
          markdown-mode
          meson-mode
          multiple-cursors
          nerd-icons
          nix-mode
          nyan-mode
          orderless
          org-modern
          perspective
          pretty-mode
          projectile
          rust-mode
          sideline-flycheck
          solo-jazz-theme
          telephone-line
          treemacs-magit
          treemacs-projectile
          vertico
          visual-regexp
          visual-regexp-steroids
          xref
          yaml-mode
          yasnippet
          all-the-icons
        ];
  };

  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    multimarkdown

    # Dev
    vscode-extensions.ms-vscode.cpptools

    # LSP
    bash-language-server
    dockerfile-language-server-nodejs
    mesonlsp
    nil
    nixpkgs-fmt
    nodePackages.vscode-json-languageserver
    nodePackages.unified-language-server
  ];
}
