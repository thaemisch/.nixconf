{ pkgs, lib, config, ...}: {    
    imports = [
      ./_enables
      ./home
      ./programs
      ./wm
    ];

}
