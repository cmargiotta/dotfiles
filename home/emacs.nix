{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      company
      dap-mode
      dashboard
      elisp-autofmt
      ement
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
      nerd-icons
      nix-mode
      perspective
      projectile
      rainbow-mode
      sideline-flycheck
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
