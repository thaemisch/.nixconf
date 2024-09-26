{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";

  home.stateVersion = "24.05"; # Please read the comment before changing.
    
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      c = "clear";
      s = "sudo";
      sv = "sudo nvim";
      vim = "nvim";
      cl = "clear && pwd && ls -la";
      cdc = "cd && clear";
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#nixos";
      nc-conf = "nvim ~/.nixconf/hosts/nixos/configuration.nix";
      nc-home = "nvim ~/.nixconf/hosts/nixos/home.nix";
      nc-flake = "nvim ~/.nixconf/flake.nix";
      nc = "cd ~/.nixconf/";
      ncn = "cd ~/.nixconf/hosts/nixos/";
      ncm = "cd ~/.nixconf/modules";
      ncmn = "cd ~/.nixconf/modules/nixos";
      ncmh = "cd ~/.nixconf/modules/home-manager";
    };
    autosuggestion.enable= true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  programs.home-manager.enable = true;
}
