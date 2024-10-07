{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Others
    busybox
    duf
    fd
    git
    glibcLocales
    gnome-keyring
    gnupg
    btop
    mangohud
    libsecret
    nano
    prusa-slicer
    ntfs3g
    pass-secret-service
    socat
    unzip
    wget
    zip

    inputs.zen-browser.packages."${system}".default
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "cinny-unwrapped-4.2.1"
    "cinny-4.2.1"
    "openssl-1.1.1w"
  ];

  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      extraPackages = with pkgs; [
        curl
        glib
        libGL
        extest
        freetype
        gtk3
        gtk3-x11
        harfbuzz
        keyutils
        krb5
        fontconfig
        libgdiplus
        freetype
        libidn2
        libxkbcommon
        libkrb5
        libpng
        libpsl
        libpulseaudio
        libthai
        libvorbis
        mono
        nghttp2
        openssl_1_1
        pango
        rtmpdump
        stdenv.cc.cc.lib
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        zlib
        mono
        xorg.libX11
        libdbusmenu
        dbus
      ];
      gamescopeSession = {
        enable = true;
        args = [
          "-w 3440"
          "-h 1440"
          "-f"
          "-e"
        ];
        env = {
          ENABLE_GAMESCOPE_WSI = "1";
          WLR_RENDERER = "vulkan";
        };
      };
    };

    gamescope = {
      enable = true;
      # capSysNice = true;
    };

    gamemode = {
      enable = true;
      settings.custom = {
        start = "nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'";
        end = "nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=0'";
      };
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    xwayland.enable = true;

    dconf = {
      enable = true;
    };
  };
}
