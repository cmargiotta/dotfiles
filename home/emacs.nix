{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      envrc
      ligature
      company
      dap-mode
      flycheck
      xref
      sideline-flycheck
      flycheck-rust
      flycheck-projectile
      flycheck-clang-tidy
      treemacs-projectile
      treemacs-magit
      magit
      projectile
      helm
      helm-xref
      helm-projectile
      lsp-mode
      lsp-treemacs
      lsp-ui
      yasnippet
      kanagawa-theme
    ] ++ [
      pkgs.vscode-extensions.ms-vscode.cpptools
    ];
  };
}