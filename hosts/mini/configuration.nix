# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/config-m.nix
    inputs.home-manager.nixosModules.default
  ];
  ############################################
  # HOST SPECIFIC ############################ also change username in #USER section below
  networking.hostName = "mini";

  services.kmonad = {
    enable = true;
    keyboards = {
      myKMonadOutput = {
        device = "/dev/input/by-id/usb-RDR_IQUNIX_MQ80_KB-event-kbd";
        config = builtins.readFile ../../dots/kmonad/75_ansi_us_intl.kbd;
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tim = import ./home.nix;
  };
  

  ############################################
  # PACKAGES #################################
  programs.noisetorch.enable = true;
  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  
  ############################################
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
