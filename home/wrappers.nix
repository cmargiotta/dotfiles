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

    webcord = {
      name = "Webcord";
      genericName = "Discord and Fosscord client";
      terminal = false;
      categories = [ "Network" "InstantMessaging" ];
      mimeType = [ "x-scheme-handler/discord" ];
      icon = "webcord";
      exec = "webcord --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland";
    };

    prusa-slicer = {
      name = "Prusa Slicer";
      terminal = false;
      mimeType = [ "x-scheme-handler/prusa-slicer" ];
      icon = "prusa-slicer";
      exec = "LC_ALL=C prusa-slicer";
    };
  };
}
