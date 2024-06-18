{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:
{
  home.packages = with pkgs; [
    arandr
    grimblast
    hyprland-protocols
    libnotify
    libGL
    glmark2
    hyprpaper
    hyprcursor
    jq
    hyprlock
    font-awesome
    nwg-look
    swaynotificationcenter
    pamixer
    rofi-wayland
    slurp
    scratchpad
    swappy
    pulseaudio
    waypipe
    wev
    wl-clipboard
    wlr-randr
    xorg.xhost
  ];

  xdg.configFile.wofi = {
    source = ./config/rofi;
    target = "rofi";
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./config/waybar;
    target = "waybar";
    recursive = true;
  };

  xdg.configFile.wal_templates = {
    source = ./config/wal-templates;
    target = "wal/templates";
    recursive = true;
  };

  xdg.configFile.ironbar = {
    source = ./config/ironbar;
    target = "ironbar";
    recursive = true;
  };

  xdg.configFile.swaync = {
    source = ./config/swaync;
    target = "swaync";
    recursive = true;
  };

  xdg.configFile.hyprland_scripts = {
    source = ./config/Hyprland/scripts;
    target = "hypr/scripts";
  };

  xdg.configFile.hyprlock = {
    source = ./config/Hyprland/hyprlock.conf;
    target = "hypr/hyprlock.conf";
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.gBar = {
    enable = true;
    extraCSS = (builtins.readFile ./config/gBar/style.css);
    config = {
      Location = "B";
      CPUThermalZone = "/sys/devices/platform/coretemp.0/hwmon/hwmon5/temp1_input";
      CenterTime = true;
      AudioInput = true;
      AudioRevealer = true;
      NetworkAdapter = "wlp0s20f3";
      EnableSNI = true;
    };
    extraConfig = ''
      WidgetsLeft: [Sensors]
      WidgetsCenter: [Time]
      WidgetsRight: [Tray, Audio, Bluetooth, Network]
    '';
  };

  programs.pywal.enable = true;
}
