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
      rebuild = "cd ~/.nixconf && sudo nixos-rebuild switch --flake .#mini";
      linein = "pactl load-module module-loopback source=alsa_input.pci-0000_00_1f.3.analog-stereo sink=bluez_output.14_3F_A6_90_D5_CD.1 latency_msec=1";
      lineoff = "pactl unload-module module-loopback";
    };
  };

  home.packages = [
    pkgs.moonlight-qt
    pkgs.equibop
  ];

  home.file = {
    ".config/hypr".source = ../../dots/hyprland/hypr/devices/mini;
  };
}
