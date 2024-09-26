{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/home-manager
  ];
  ################################
  # HOST SPECIFIC ################
  gui-hm.enable = true;
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#desktop";
      nc-conf = "nvim ~/.nixconf/hosts/desktop/configuration.nix";
      nc-home = "nvim ~/.nixconf/hosts/desktop/home.nix";
    };
  };
  
  home.file = {
    ".config/hypr".source = ../../dots/hyprland/hypr/hypr-3mon;
  };

  home.username = "tim";
  home.homeDirectory = "/home/tim";
  ################################
  ################################
  home.stateVersion = "24.05"; # Please read the comment before changing.
    
  home.sessionVariables = {
    EDITOR = "nvim";
  };  

  programs.home-manager.enable = true;
}
