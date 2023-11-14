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

    steam = {
      name = "Steam";
      exec = "env SDL_VIDEODRIVER=x11 steam-gamescope %U";
      icon = "steam";
      terminal = false;
      categories = [ "Network" "Game" ];
      mimeType = [ "x-scheme-handler/steam" "x-scheme-handler/steamlink" ];
    };
  };
}
