{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      beacon
      colorful-mode
      company
      dap-mode
      dashboard
      dim
      elisp-autofmt
      flycheck
      flycheck-clang-tidy
      flycheck-projectile
      flycheck-rust
      helm
      helm-projectile
      helm-xref
      hl-todo
      kanagawa-theme
      ligature
      lsp-mode
      lsp-treemacs
      lsp-ui
      magit
      multiple-cursors
      nerd-icons
      nix-mode
      nyan-mode
      perspective
      pretty-mode
      projectile
      sideline-flycheck
      solo-jazz-theme
      treemacs-magit
      treemacs-projectile
      xref
      yasnippet
 envrc
    ] ++ [
      pkgs.vscode-extensions.ms-vscode.cpptools
    ];
  };
}
