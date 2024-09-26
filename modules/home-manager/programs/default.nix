{ pkgs, lib, config, ...}: {    
    imports = [
      ./editor
      ./git
      ./term
    ];
}
