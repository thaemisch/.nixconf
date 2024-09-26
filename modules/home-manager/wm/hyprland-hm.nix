{ pkgs, lib, config, ...}: {
  options = {
    hyprland-hm.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland-hm.enable {
    home.file = {
      ".config/rofi".source = ../../../dots/hyprland/rofi;
    };
  };
}            
