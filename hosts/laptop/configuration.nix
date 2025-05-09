# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/config-m.nix
  ];
  ############################################
  # HOST SPECIFIC ############################ also change username in #USER section below
  networking.hostName = "laptop";

  services.kmonad = {
    enable = true;
    keyboards = {
      mzKMonadOutput = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ../../dots/kmonad/laptopV2.kbd;
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tim = import ./home.nix;
  };


  environment.systemPackages = with pkgs; [
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
