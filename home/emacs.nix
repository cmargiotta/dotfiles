{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      all-the-icons
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
      elisp-autofmt
      embark
      embark-consult
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
      multiple-cursors
      nerd-icons
      nix-mode
      nyan-mode
      orderless
      org-modern
      perspective
      pretty-mode
      projectile
      sideline-flycheck
      solo-jazz-theme
      telephone-line
      treemacs-magit
      treemacs-projectile
      vertico
      visual-regexp
      visual-regexp-steroids
      xref
      yasnippet
 envrc
    ] ++ [
      pkgs.emacs-all-the-icons-fonts
      pkgs.vscode-extensions.ms-vscode.cpptools
    ];
  };
}
