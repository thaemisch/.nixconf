{ pkgs, lib, config, ...}: {
  options = {
    gui-nm.enable = lib.mkEnableOption "enables gui enables";
  };

  config = lib.mkIf config.gui-nm.enable {
    hyprland-nm.enable = true;
    stylix-nm.enable = true;
  };
  }
