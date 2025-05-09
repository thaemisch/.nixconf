{ pkgs, lib, config, ...}: {
    options = {
      dconf-hm.enable = lib.mkEnableOption "enables dconf";
    };

    config = lib.mkIf config.dconf-hm.enable {
        home.packages = with pkgs; [
          gnome-tweaks
          gnomeExtensions.launch-new-instance
          gnomeExtensions.blur-my-shell
          gnomeExtensions.dash-to-dock
          gnomeExtensions.clipboard-indicator
          gnomeExtensions.lock-keys
          gnomeExtensions.tray-icons-reloaded
          gnomeExtensions.ddterm
          gnomeExtensions.gtile
          gnomeExtensions.gsnap
          gnomeExtensions.media-controls
        ];
        dconf = {
            enable = true;
            settings = {
            "org/gnome/settings-daemon/plugins/power" = {
                idle-dim = true;
                power-saver-profile-on-low-battery = true;
                sleep-inactive-battery-type = "suspend";
                sleep-inactive-battery-timeout = 900;
                sleep-inactive-ac-type = "nothing";
                power-button-action = "suspend";
            };
            "org/gnome/desktop/interface" = {
                show-battery-percentage = true;
                enable-hot-corners = false;
                clock-show-weekday = true;
                clock-show-date = true;
                clock-show-seconds = true;
                color-scheme = lib.mkForce "prefer-dark";
            };
            "org/gnome/desktop/peripherals/touchpad" = {
                send-events = "enabled";
                disable-while-typing = true;
                click-method = "fingers";
                tap-to-click = true;
                two-finger-scrolling-enabled = true;
                natural-scroll = true;
            };
            "org/gnome/mutter" = {
                edge-tiling = true;
                dynamic-workspaces = true;
                workspaces-only-on-primary = false;
            };
            "org/gome/app-switcher" = {
                current-workspace-only = true;
            };
            "org/gtk/settings/file-chooser" = {
                clock-format = "24h";
            };
            "org/gnome/desktop/wm/preferences" = {
                focus-mode = "sloppy";
                auto-raise = false;
            };
            "org/gnome/shell" = {
                disable-user-extensions = false;
                enabled-extensions = [
                    "blur-my-shell@aunetx"
                    "clipboard-indicator@tudmotu.com"
                    "dash-to-dock@micxgx.gmail.com"
                    "ddterm@amezin.github.com"
                    "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
                    "lockkeys@vaina.lt"
                    "gTile@vibou"
                    "mediacontrols@cliffniff.github.com"
                    #"trayIconsReloaded@selfmade.pl"
                ];
            };
            "org/gnome/shell/extensions/clipboard-indicator" = {
                move-item-first = true;
                strip-text = true;
                keep-selected-on-clear = true;
                clear-on-boot = true;
            };
            "org/gnome/shell/extensions/dash-to-dock" = {
                click-action = "launch";
                scroll-action = "cycle-windows";
                running-indicator-style = "DASHES";
                intellihide-mode = "ALL_WINDOWS";
            };
            "org/gnome/shell/extensions/mediacontrols" = {
                scroll-labels = false;
                hide-media-notification = true;
                show-control-icon-seek-forward = false;
                show-control-icon-seek-backward = false;
                show-control-icons-previous = false;
                show-control-icons-next = false;
                show-control-icons-play = false;
                labels-order = "['TITLE', '~', 'ARTIST']";
                mouse-action-left = "SHOW_POPUP_MENU";
                mouse-action-middle = "RAISE_PLAYER";
                mouse-action-right = "OPEN_PREFERENCES";
                mouse-action-double = "PLAY_PAUSE";
                mouse-action-scroll-up = "VOLUME_DOWN";
                mouse-action-scroll-down = "VOLUME_UP";
            };
            "com/github/amezin/ddterm" = {
                panel-icon-type = "none";
            };
            };
        };
    };
}
