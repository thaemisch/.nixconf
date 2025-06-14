{ config, pkgs, lib, ... }:

{
    programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    services.kdeconnect.enable = true;

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
