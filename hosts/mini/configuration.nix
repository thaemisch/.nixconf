# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./../../modules/nixos
      inputs.home-manager.nixosModules.default
    ];
  ############################################
  # HOST SPECIFIC ############################ also change username in #USER section below
  gui-nm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-vaapi-driver
  ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  networking.hostName = "mini";

  services.kmonad = {
    enable = true;
    keyboards = {
      myKMonadOutput = {
        device = "/dev/input/by-id/usb-RDR_IQUNIX_MQ80_KB-event-kbd";
        config = builtins.readFile /home/tim/.nixconf/dots/kmonad/75_ansi_us_intl.kbd;
      };
    };
  };
  ############################################
  # BOOTLOADER ###############################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [ evdi ];
  ############################################
  # NETWORKING ###############################
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };

  services.openssh.enable = true;

  ############################################
  # USER #####################################
  users.users.tim = {
    isNormalUser = true;
    description = "Tim";
    extraGroups = [ "networkmanager" "wheel" "docker" "openrazer" "dialout"];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tim = import ./home.nix;
  };
  ############################################
  # MISC #####################################
  hardware.openrazer.enable = true;
  

  ############################################
  # PACKAGES #################################
  programs.zsh.enable = true;
  programs.noisetorch.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    wireguard-tools
    nodejs_22
    usbutils
    pciutils
    pipewire
    wireplumber
    pavucontrol
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
