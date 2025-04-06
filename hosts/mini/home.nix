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
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#mini";
      nc-conf = "nvim ~/.nixconf/hosts/mini/configuration.nix";
      nc-home = "nvim ~/.nixconf/hosts/mini/home.nix";
      linein = "pactl load-module module-loopback source=alsa_input.pci-0000_00_1f.3.analog-stereo sink=bluez_output.14_3F_A6_90_D5_CD.1 latency_msec=1";
      lineoff = "pactl unload-module module-loopback";
    };
  };

  home.packages = [
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    pkgs.moonlight-qt
  ];

  programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
  };
  
  home.file = {
    ".config/hypr".source = ../../dots/hyprland/hypr/hypr-mini;
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
