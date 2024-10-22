{ pkgs, lib, config, ...}: {    
    imports = [
      ./editor
      ./term
      ./comms
    ];
}
