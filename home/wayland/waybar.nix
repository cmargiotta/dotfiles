{ pkgs
, osConfig
, inputs
, ...
}:
let
  laptop = osConfig.networking.hostName == "cmargiotta";
  desktop = osConfig.networking.hostName == "nixos-desktop";
in
{
  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.system}.waybar;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    settings = {
      main = {
        position = "top";
        layer = "top";
        height = 50;

        output = "!HDMI-A-2";

        modules-left = [
          "cava"
          "hyprland/window"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "memory"
          "cpu"
          "tray"
          "clock"
        ];

        cava = {
          framerate = 30;
          autosens = 1;
          sensitivity = 1;
          bars = 8;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          actions = {
            on-click-right = "mode";
          };
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{name}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          sort-by-number = true;
        };

        memory = {
          format = " {}%";
          format-alt = " {used}/{total} GiB";
          interval = 5;
        };

        cpu = {
          format = " {usage}%";
          interval = 5;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 25;
          separate-outputs = true;
        };

        clock = {
          interval = 60;
          tooltip = true;
          format = "{:%H.%M}";
          tooltip-format = "{:%Y-%m-%d}";
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0px;
          font-family: CaskaydiaCove Nerd Font;
          font-size: 20px;
          font-style: normal;
          font-weight: bold;
          min-height: 0;
      	}

      window#waybar {
           background: rgba(0, 0, 0, 0);
         /* background: rgba(76,86,106,0.8); */
      }

      /*
      window#waybar > box {
          border-radius: 8px;
          margin: 4px 8px 8px 8px;
          background-color: rgba(59 ,66 ,82, 0.75);
          box-shadow: 4px 4px 2px 1px rgba(10, 0, 20, 0.15);
      }
      */

      @define-color bar-bg rgba(0, 0, 0, 0);

      @define-color main-bg #11111b;
      @define-color main-fg #cdd6f4;

      @define-color wb-act-bg #a6adc8;
      @define-color wb-act-fg #313244;

      @define-color wb-hvr-bg #f5c2e7;
      @define-color wb-hvr-fg #313244;
      @define-color color_bg #2e3440;
      @define-color color_bg_dark #292e39;
      @define-color color_border #424242;
      @define-color color_border_active #b48ead;
      @define-color color_text #5e81ac;
      @define-color color_urgent #bf616a;

      #clock,
      #pulseaudio,
      #custom-launcher,
      #custom-pacmanAlt,
      #custom-wlogout,
      #custom-playerctl,
      #cpu,
      #memory,
      #disk,
      #cava,
      #language,
      #window,

      #cava {
       /* font-family: renogare;*/
      }

      tooltip {
        background: rgba(43, 48, 59, 0.7);
        border-radius: 16px;
      }
      tooltip label {
        color: #D8DEE9;
      }


       #clock {
        transition: all 0.5s cubic-bezier(0.5, 1, 0.89, 1);
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: rgb(180,142,173);
        background: linear-gradient(45deg, rgba(180,142,173,1) 0%, rgba(180,142,173,1) 43%, rgba(129,161,193,1) 80%, rgba(94,129,172,1)100%);
        background-size: 300% 300%;
        /* animation: gradient 5s ease infinite;*/
        color: #4c566a;
        /* box-shadow: rgba(10, 0, 20, 0.3) 0px 2px 5px, rgba(10, 0, 20, 0.15) 0px 2px 8px; */
        /* border: 1.5px solid @border; */
      }

      #pulseaudio {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #88c0d0;
        color: #4c566a;
      }

      #pulseaudio.muted {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 30px 0px 20px;
        color: #BF616A;
      }

      #custom-pacmanAlt {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #a3be8c;
        color: #4c566a;
        box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      }

      #cpu {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #D08770;
        color: #4c566a;
        box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      }

      #memory {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        color: #4c566a;
        background: rgb(143,188,187);
        background: linear-gradient(52deg, rgba(180,142,173,1) 0%, rgba(136,192,208,1) 32%, 	rgba(129,161,193,1) 72%, rgba(163,190,140,1) 100%);
        background-size: 300% 300%;
        /*animation: gradient 20s ease infinite;*/
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      }

      #disk {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #5E81AC;
       /* background: rgb(143,188,187);
        background: linear-gradient(52deg, rgba(180,142,173,1) 0%, rgba(136,192,208,1) 32%, 	rgba(129,161,193,1) 72%, rgba(163,190,140,1) 100%);
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377); */
        color: #4c566a;
      }

      #custom-launcher {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #88c0d0;
        color: #4c566a;
        box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      }

      #cava {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #88c0d0;
        color: #4c566a;
        box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      }

      #custom-wlogout {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #a3be8c;
        color: #4c566a;
      }

      #language {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #a3be8c;
        color: #4c566a;
        font-size: 20px;
        box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      }

      #window {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
      /*
        background: rgb(143,188,187);
        background: linear-gradient(52deg, rgba(180,142,173,1) 0%, rgba(136,192,208,1) 32%, 	rgba(129,161,193,1) 72%, rgba(163,190,140,1) 100%);
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        color: #4c566a;
      */
          background: rgb(94,129,172);
          color: rgb(76,86,106);
          background: radial-gradient(circle, rgba(195,164,189,1) 0%, rgba(187,153,181,1) 12%, rgba(94,129,172,1) 19%, rgba(180,142,173,1) 20%, rgba(94,129,172,1) 82%, rgba(136,192,208,1) 83%, rgba(141,170,199,1) 90%, rgba(129,161,193,1) 100%);
          background-size: 400% 400%;
          /*animation: gradient 7s linear infinite;*/
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
          border-radius: 16px;
      }

      window#waybar.chromium {
          background-color: #eeeeee;
          color: #000000;
      }


      #tray {
        color: rgb(84, 111, 175);
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: rgb(238, 190, 190);
        background: linear-gradient(45deg, rgb(244, 219, 214) 0%, rgb(223, 221, 238) 43%, rgb(245, 208, 225) 100%);
        background-size: 300% 300%;
        /*animation: gradient 5s ease infinite;*/
      }

      #workspaces {
        	margin: 5px 5px;
          padding: 8px 5px;
      	  border-radius: 16px;
      	  background: #4C566A;
      }

      #workspaces button {
          box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 15px;
          color: #cba6f7;
          background-color: #5E81AC;
          transition: all 0.3s ease-in-out;
      }


      #workspaces button.active {
          color: black;
          background-color: #cdd6f4;
          border-radius: 16px;
          min-width: 50px;
          background-size: 400% 400%;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
      	background-color: #cdd6f4;
      	color: #cdd6f4;
      	border-radius: 16px;
        min-width: 50px;
        background-size: 400% 400%;
      }

      #workspaces button.urgent {
      	  border-radius: 16px;
      	  background-color: #BF616A;
      }

      #custom-playerctl {
        border-radius: 16px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        background: #a3be8c;
        color: #4c566a;
      }

      #custom-playerlabel {
        	margin: 5px 5px;
          padding: 8px 5px;
      	  border-radius: 16px;
      	  background: #B48EAD;
      }

      @keyframes gradient {
        0% {
          background-position: 0% 50%;
        }

        50% {
          background-position: 100% 50%;
        }

        100% {
          background-position: 0% 50%;
        }
      }

      @keyframes gradient_f_nh {
      	0% {
      		background-position: 0% 200%;
      	}
      	100% {
      		background-position: 200% 200%;
      	}
      }
    '';
  };
}
