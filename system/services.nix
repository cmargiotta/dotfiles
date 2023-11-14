{ lib, config, pkgs, ... }:
{
  services = {
    openssh.enable = true;
    pcscd.enable = true;
    printing.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    upower.enable = true;

    dbus.packages = [ pkgs.gcr ];

    # Permissions for JLink
    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="1366", ATTR{idProduct}=="0101", MODE="0666", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTR{idVendor}=="1366", ATTR{idProduct}=="1020", MODE="0666", GROUP="plugdev"
    '';

    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      jack.enable = true;
      pulse.enable = true;

      socketActivation = true;
    };
  };

  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];

    enable = true;
  };

  xdg.menus.enable = true;
  xdg.autostart.enable = true;
}
