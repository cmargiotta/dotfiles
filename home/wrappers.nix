{ config, ... }:
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

    chitubox = {
      name = "Chitubox";
      comment = "A Revolutionary Tool to Change 3D Printing Processes within One Click";
      terminal = false;
      exec = "${config.home.homeDirectory}/dotfiles/chitubox/run.sh";
      icon = ../chitubox/icon.png;
    };
  };
}
