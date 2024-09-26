{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/home-manager
  ];
  ################################
  # HOST SPECIFIC ################
  gui-hm.enable = false;
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#wsl";
      nc-conf = "nvim ~/.nixconf/hosts/wsl/configuration.nix";
      nc-home = "nvim ~/.nixconf/hosts/wsl/home.nix";
    };
  };

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  ################################
  ################################
  home.stateVersion = "24.05"; # Please read the comment before changing.
    
  home.sessionVariables = {
    EDITOR = "nvim";
  };  

  programs.home-manager.enable = true;
}
