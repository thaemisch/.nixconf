{ pkgs, lib, config, ...}: {
  options = {
    gui-hm.enable = lib.mkEnableOption "enables gui enables";
  };

  config = lib.mkIf config.gui-hm.enable {
    hyprland-hm.enable = true;
    dconf-hm.enable = true;

    vscode-hm.enable = true;
    kitty-hm.enable = true;
  };
  }
