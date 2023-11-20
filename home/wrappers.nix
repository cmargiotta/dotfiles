{ config, pkgs, nixpkgs, eww, ... }:
{
  xdg.desktopEntries = {
    mongodb-compass = {
      name = "MongoDB Compass";
      genericName = "MongoDB Compass";
      terminal = false;
      categories = [ "Network" ];
      mimeType = [ "x-scheme-handler/mongodb-compass" ];
      icon = "mongodb-compass";
      exec = "mongodb-compass --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland --ignore-additional-command-line-flags";
    };

    prusa-slicer = {
      name = "Prusa Slicer";
      terminal = false;
      mimeType = [ "x-scheme-handler/prusa-slicer" ];
      icon = "prusa-slicer %U";
      exec = "LC_ALL=C prusa-slicer";
    };

    firefox = {
      name = "Firefox";
      genericName = "Web Browser";
      exec = "hdrop firefox %U";
      terminal = false;
      icon = "firefox";
      categories = [ "Application" "Network" "WebBrowser" ];
      mimeType = [ "text/html" "text/xml" ];
    };
  };
}
