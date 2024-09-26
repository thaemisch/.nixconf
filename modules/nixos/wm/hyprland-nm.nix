{ pkgs, lib, config, ...}: {
  options = {
    hyprland-nm.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland-nm.enable {
    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal ];
    };

    environment.systemPackages = [
      (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        })
      )

      pkgs.dunst
      pkgs.libnotify

      pkgs.rofi-wayland

      pkgs.waybar-mpris

      pkgs.swww
      pkgs.blueman
    ];
  };
  }            
