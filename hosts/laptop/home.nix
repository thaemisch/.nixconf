{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/home-manager
  ];
  ################################
  # HOST SPECIFIC ################  
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#laptop";
    };
  };
  
  home.file = {
    ".config/hypr".source = ../../dots/hyprland/hypr/hypr-1mon;
  };
}
