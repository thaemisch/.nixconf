{ pkgs, lib, config, ...}: {
  imports = [
    ./gh-hm.nix
    ./git-hm.nix
  ];
  }
