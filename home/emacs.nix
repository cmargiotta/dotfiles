{ config, pkgs, lib, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      direnv
      ligature
      company
      treemacs-projectile
      treemacs-magit
      magit
      projectile
      helm
      helm-projectile
      eglot
      kanagawa-theme
    ];
  };
}