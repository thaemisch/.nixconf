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
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#laptop";
      nc-conf = "nvim ~/.nixconf/hosts/laptop/configuration.nix";
      nc-home = "nvim ~/.nixconf/hosts/laptop/home.nix";
    };
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
