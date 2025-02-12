{ inputs, lib, osConfig, ... }:
let
  laptop = osConfig.networking.hostName == "cmargiotta";
  desktop = osConfig.networking.hostName == "nixos-desktop";

  commands = import ./commands.nix;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    hyprland.enable = false;
    overwrite.enable = false;
    theme = "everforest_vivid";

    layout = {
      "bar.layouts" = {
        "*" = {
          left = [ "dashboard" "media" "cpu" "ram" "netstat" ];
          middle = [ "workspaces" ];
          right = lib.mkMerge
            [
              [ "volume" ]
              (lib.mkIf laptop [ "battery" ])
              [ "systray" "clock" "notifications" ]
            ];
        };
      };

      "bar.workspaces.applicationIconMap" =
        {
          "class:com.mitchellh.ghostty" = "";
          "class:emacs" = "";
          "class:zen" = "";
          "class:Element" = "󰍡";
        };
    };

    settings = {
      bar.autoHide = "never";
      bar.battery.hideLabelWhenFull = true;
      bar.battery.label = true;
      bar.clock.format = "%a %b %d  %H:%M:%S";
      bar.clock.icon = "󰸗";
      bar.clock.showIcon = true;
      bar.clock.showTime = true;
      bar.customModules.cpu.icon = "";
      bar.customModules.cpu.label = true;
      bar.customModules.cpu.pollingInterval = 2000;
      bar.customModules.cpu.round = true;
      bar.customModules.netstat.dynamicIcon = true;
      bar.customModules.netstat.icon = "󰖟";
      bar.customModules.netstat.label = true;
      bar.customModules.netstat.labelType = "full";
      bar.customModules.netstat.networkInLabel = "↓";
      bar.customModules.netstat.networkOutLabel = "↑";
      bar.customModules.netstat.pollingInterval = 2000;
      bar.customModules.netstat.rateUnit = "auto";
      bar.customModules.netstat.round = true;
      bar.customModules.ram.icon = "";
      bar.customModules.ram.label = true;
      bar.customModules.ram.labelType = "percentage";
      bar.customModules.ram.pollingInterval = 2000;
      bar.customModules.ram.round = true;
      bar.launcher.autoDetectIcon = true;
      bar.media.format = "{artist = - }{ title }";
      bar.media.show_active_only = true;
      bar.media.show_label = true;
      bar.media.truncation = true;
      bar.media.truncation_size = 30;
      bar.notifications.hideCountWhenZero = true;
      bar.notifications.show_total = true;
      bar.scrollSpeed = 5;
      bar.volume.label = true;
      bar.volume.rightClick = "pwvucontrol";
      bar.volume.scrollDown = "hyprpanel 'vol -5'";
      bar.volume.scrollUp = "hyprpanel 'vol +5'";
      bar.workspaces.applicationIconFallback = "󰣆";
      bar.workspaces.applicationIconOncePerWorkspace = false;
      bar.workspaces.hideUnoccupied = true;
      bar.workspaces.monitorSpecific = true;
      bar.workspaces.numbered_active_indicator = "underline";
      bar.workspaces.reverse_scroll = false;
      bar.workspaces.scroll_speed = 5;
      bar.workspaces.showAllActive = true;
      bar.workspaces.showApplicationIcons = true;
      bar.workspaces.showWsIcons = true;
      bar.workspaces.show_icons = false;
      bar.workspaces.show_numbered = false;
      bar.workspaces.spacing = 1;
      bar.workspaces.workspaceMask = false;
      bar.workspaces.workspaces = 1;
      hyprpanel.restartAgs = true;
      hyprpanel.restartCommand = "pkill -u $USER -USR1 hyprpanel; hyprpanel";
      menus.clock.time.hideSeconds = false;
      menus.clock.time.military = true;
      menus.clock.weather.enabled = true;
      menus.clock.weather.interval = 60000;
      menus.clock.weather.key = "";
      menus.clock.weather.location = "Rome";
      menus.clock.weather.unit = "metric";
      menus.dashboard.controls.enabled = true;
      menus.dashboard.directories.enabled = true;
      menus.dashboard.directories.left.directory1.command = "bash -c \"xdg-open $HOME/Downloads/\"";
      menus.dashboard.directories.left.directory1.label = "󰉍 Downloads";
      menus.dashboard.directories.left.directory2.command = "bash -c \"xdg-open $HOME/Videos/\"";
      menus.dashboard.directories.left.directory2.label = "󰉏 Videos";
      menus.dashboard.directories.left.directory3.command = "bash -c \"xdg-open $HOME/projects/\"";
      menus.dashboard.directories.left.directory3.label = "󰚝 Projects";
      menus.dashboard.directories.right.directory1.command = "bash -c \"xdg-open $HOME/Documents/\"";
      menus.dashboard.directories.right.directory1.label = "󱧶 Documents";
      menus.dashboard.directories.right.directory2.command = "bash -c \"xdg-open $HOME/Pictures/\"";
      menus.dashboard.directories.right.directory2.label = "󰉏 Pictures";
      menus.dashboard.directories.right.directory3.command = "bash -c \"xdg-open $HOME/\"";
      menus.dashboard.directories.right.directory3.label = "󱂵 Home";
      menus.dashboard.powermenu.avatar.image = toString ../../assets/dashboard-logo.png;
      menus.dashboard.powermenu.avatar.name = "system";
      menus.dashboard.powermenu.confirmation = true;
      menus.dashboard.powermenu.logout = "hyprctl dispatch exit";
      menus.dashboard.powermenu.reboot = "sudo systemctl reboot";
      menus.dashboard.powermenu.shutdown = "sudo systemctl poweroff";
      menus.dashboard.powermenu.sleep = "systemctl suspend";
      menus.dashboard.shortcuts.enabled = true;
      menus.dashboard.shortcuts.left.shortcut1.command = "zen-bin";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰈹";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Zen Browser";
      menus.dashboard.shortcuts.left.shortcut2.command = "feishin";
      menus.dashboard.shortcuts.left.shortcut2.icon = "";
      menus.dashboard.shortcuts.left.shortcut2.tooltip = "Feishin";
      menus.dashboard.shortcuts.left.shortcut3.command = "nemo";
      menus.dashboard.shortcuts.left.shortcut3.icon = "";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "Files";
      menus.dashboard.shortcuts.left.shortcut4.command = "emacs";
      menus.dashboard.shortcuts.left.shortcut4.icon = "";
      menus.dashboard.shortcuts.left.shortcut4.tooltip = "Emacs";
      menus.dashboard.shortcuts.right.shortcut1.command = "sleep 0.5 && hyprpicker -a";
      menus.dashboard.shortcuts.right.shortcut1.icon = "";
      menus.dashboard.shortcuts.right.shortcut1.tooltip = "Color Picker";
      menus.dashboard.shortcuts.right.shortcut3.command = "${commands.screenshot}";
      menus.dashboard.shortcuts.right.shortcut3.icon = "󰄀";
      menus.dashboard.shortcuts.right.shortcut3.tooltip = "Screenshot";
      menus.dashboard.stats.enable_gpu = false;
      menus.dashboard.stats.enabled = true;
      menus.dashboard.stats.interval = 2000;
      menus.media.displayTime = false;
      menus.media.displayTimeTooltip = false;
      menus.media.hideAlbum = false;
      menus.media.hideAuthor = false;
      menus.media.noMediaText = "No Media Currently Playing";
      menus.transition = "crossfade";
      menus.transitionTime = 200;
      menus.volume.raiseMaximumVolume = false;
      notifications.active_monitor = true;
      notifications.cache_actions = true;
      notifications.clearDelay = 100;
      notifications.displayedTotal = 10;
      notifications.monitor = 0;
      notifications.position = "top right";
      notifications.showActionsOnHover = false;
      notifications.timeout = 7000;
      scalingPriority = "gdk";
      tear = false;
      terminal = "$TERM";
      theme.bar.border.location = "none";
      theme.bar.border.width = "0.15em";
      theme.bar.border_radius = "0.4em";
      theme.bar.buttons.background_hover_opacity = 100;
      theme.bar.buttons.background_opacity = 100;
      theme.bar.buttons.battery.enableBorder = false;
      theme.bar.buttons.battery.spacing = "0.5em";
      theme.bar.buttons.bluetooth.enableBorder = false;
      theme.bar.buttons.bluetooth.spacing = "0.5em";
      theme.bar.buttons.borderSize = "0.1em";
      theme.bar.buttons.clock.enableBorder = false;
      theme.bar.buttons.clock.spacing = "0.5em";
      theme.bar.buttons.dashboard.enableBorder = false;
      theme.bar.buttons.dashboard.spacing = "0.5em";
      theme.bar.buttons.enableBorders = false;
      theme.bar.buttons.innerRadiusMultiplier = "0.4";
      theme.bar.buttons.media.enableBorder = false;
      theme.bar.buttons.media.spacing = "0.5em";
      theme.bar.buttons.modules.cpu.enableBorder = false;
      theme.bar.buttons.modules.cpu.spacing = "0.5em";
      theme.bar.buttons.modules.cpuTemp.enableBorder = false;
      theme.bar.buttons.modules.cpuTemp.spacing = "0.5em";
      theme.bar.buttons.modules.hypridle.enableBorder = false;
      theme.bar.buttons.modules.hypridle.spacing = "0.45em";
      theme.bar.buttons.modules.hyprsunset.enableBorder = false;
      theme.bar.buttons.modules.hyprsunset.spacing = "0.45em";
      theme.bar.buttons.modules.kbLayout.enableBorder = false;
      theme.bar.buttons.modules.kbLayout.spacing = "0.45em";
      theme.bar.buttons.modules.netstat.enableBorder = false;
      theme.bar.buttons.modules.netstat.spacing = "0.45em";
      theme.bar.buttons.modules.power.enableBorder = false;
      theme.bar.buttons.modules.power.spacing = "0.45em";
      theme.bar.buttons.modules.ram.enableBorder = false;
      theme.bar.buttons.modules.ram.spacing = "0.45em";
      theme.bar.buttons.modules.storage.enableBorder = false;
      theme.bar.buttons.modules.storage.spacing = "0.45em";
      theme.bar.buttons.modules.submap.enableBorder = false;
      theme.bar.buttons.modules.submap.spacing = "0.45em";
      theme.bar.buttons.modules.updates.enableBorder = false;
      theme.bar.buttons.modules.updates.spacing = "0.45em";
      theme.bar.buttons.modules.weather.enableBorder = false;
      theme.bar.buttons.modules.weather.spacing = "0.45em";
      theme.bar.buttons.monochrome = false;
      theme.bar.buttons.network.enableBorder = false;
      theme.bar.buttons.network.spacing = "0.5em";
      theme.bar.buttons.notifications.enableBorder = false;
      theme.bar.buttons.notifications.spacing = "0.5em";
      theme.bar.buttons.opacity = 100;
      theme.bar.buttons.padding_x = "0.7rem";
      theme.bar.buttons.padding_y = "0.2rem";
      theme.bar.buttons.radius = "0.3em";
      theme.bar.buttons.spacing = "0.25em";
      theme.bar.buttons.systray.enableBorder = false;
      theme.bar.buttons.systray.spacing = "0.5em";
      theme.bar.buttons.volume.enableBorder = false;
      theme.bar.buttons.volume.spacing = "0.5em";
      theme.bar.buttons.windowtitle.enableBorder = false;
      theme.bar.buttons.windowtitle.spacing = "0.5em";
      theme.bar.buttons.workspaces.enableBorder = false;
      theme.bar.buttons.workspaces.fontSize = "1.2em";
      theme.bar.buttons.workspaces.numbered_active_highlight_border = "0.2em";
      theme.bar.buttons.workspaces.numbered_active_highlight_padding = "0.2em";
      theme.bar.buttons.workspaces.pill.active_width = "12em";
      theme.bar.buttons.workspaces.pill.height = "4em";
      theme.bar.buttons.workspaces.pill.radius = "1.9rem * 0.6";
      theme.bar.buttons.workspaces.pill.width = "4em";
      theme.bar.buttons.workspaces.smartHighlight = true;
      theme.bar.buttons.workspaces.spacing = "0.8em";
      theme.bar.buttons.y_margins = "0.4em";
      theme.bar.dropdownGap = "2.9em";
      theme.bar.floating = false;
      theme.bar.label_spacing = "0.5em";
      theme.bar.layer = "top";
      theme.bar.location = "top";
      theme.bar.margin_bottom = "0em";
      theme.bar.margin_sides = "0.5em";
      theme.bar.margin_top = "0.5em";
      theme.bar.menus.border.radius = "0.7em";
      theme.bar.menus.border.size = "0.13em";
      theme.bar.menus.buttons.radius = "0.4em";
      theme.bar.menus.card_radius = "0.4em";
      theme.bar.menus.menu.battery.scaling = 100;
      theme.bar.menus.menu.bluetooth.scaling = 100;
      theme.bar.menus.menu.clock.scaling = 100;
      theme.bar.menus.menu.dashboard.confirmation_scaling = 100;
      theme.bar.menus.menu.dashboard.profile.radius = "0.4em";
      theme.bar.menus.menu.dashboard.profile.size = "8.5em";
      theme.bar.menus.menu.dashboard.scaling = 100;
      theme.bar.menus.menu.media.card.tint = 85;
      theme.bar.menus.menu.media.scaling = 100;
      theme.bar.menus.menu.network.scaling = 100;
      theme.bar.menus.menu.notifications.height = "58em";
      theme.bar.menus.menu.notifications.pager.show = true;
      theme.bar.menus.menu.notifications.scaling = 100;
      theme.bar.menus.menu.notifications.scrollbar.radius = "0.2em";
      theme.bar.menus.menu.notifications.scrollbar.width = "0.35em";
      theme.bar.menus.menu.power.radius = "0.4em";
      theme.bar.menus.menu.power.scaling = 90;
      theme.bar.menus.menu.volume.scaling = 100;
      theme.bar.menus.monochrome = false;
      theme.bar.menus.opacity = 95;
      theme.bar.menus.popover.radius = "0.4em";
      theme.bar.menus.popover.scaling = 100;
      theme.bar.menus.progressbar.radius = "0.3rem";
      theme.bar.menus.scroller.radius = "0.7em";
      theme.bar.menus.scroller.width = "0.25em";
      theme.bar.menus.slider.progress_radius = "0.3rem";
      theme.bar.menus.slider.slider_radius = "0.3rem";
      theme.bar.menus.switch.radius = "0.2em";
      theme.bar.menus.switch.slider_radius = "0.2em";
      theme.bar.menus.tooltip.radius = "0.3em";
      theme.bar.opacity = 100;
      theme.bar.outer_spacing = "1.6em";
      theme.bar.scaling = 100;
      theme.bar.transparent = true;
      theme.font.name = "RobotoMono Nerd Font Mono Light";
      theme.font.size = "16px";
      theme.font.weight = 600;
      theme.matugen = false;
      theme.matugen_settings.contrast = 0;
      theme.matugen_settings.mode = "dark";
      theme.matugen_settings.scheme_type = "tonal-spot";
      theme.matugen_settings.variation = "standard_1";
      theme.notification.border_radius = "0.6em";
      theme.notification.opacity = 100;
      theme.notification.scaling = 100;
      theme.osd.active_monitor = true;
      theme.osd.duration = 2000;
      theme.osd.enable = true;
      theme.osd.location = "right";
      theme.osd.margins = "0px 5px 0px 0px";
      theme.osd.monitor = 0;
      theme.osd.muted_zero = false;
      theme.osd.opacity = 100;
      theme.osd.orientation = "vertical";
      theme.osd.radius = "0.4em";
      theme.osd.scaling = 100;
      theme.tooltip.scaling = 100;
    };
  };
}
