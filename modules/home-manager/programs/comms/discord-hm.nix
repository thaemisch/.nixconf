{ pkgs, lib, config, ...}: {
    options = {
      discord-hm.enable = lib.mkEnableOption "enables discord";
    };

    config = lib.mkIf config.discord-hm.enable {
      nixpkgs.config.allowUnfree = true;

      home.packages = [
        (pkgs.discord.override {
          withOpenASAR = true;
          withVencord = true;
        })
        pkgs.vesktop
      ];
    };
  }
