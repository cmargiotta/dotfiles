{ config, lib, pkgs, ... }:
{
  programs.neomutt = {
    enable = true;
    sidebar = {
      enable = true;
      
    };
  };
}