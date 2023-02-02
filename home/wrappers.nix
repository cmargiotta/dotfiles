{ config, pkgs, nixpkgs, eww, ... }:
{
  xdg.desktopEntries = {
    code_x11 = {
      name = "Visual Studio Code";
      genericName = "Text Editor";
      terminal = false;
      categories = [ "Utility" "TextEditor" "Development" "IDE" ];
      mimeType = [ "text/plain" "inode/directory" ];
      icon = "code";
      exec = "code --ozone-platform=x11";
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
  };
}
