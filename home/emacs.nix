{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      company
      dap-mode
      elisp-autofmt
      flycheck
      flycheck-clang-tidy
      flycheck-projectile
      flycheck-rust
      helm
      helm-projectile
      helm-xref
      kanagawa-theme
      ligature
      lsp-mode
      lsp-treemacs
      lsp-ui
      magit
      nix-mode
      projectile
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