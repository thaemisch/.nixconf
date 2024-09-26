{ pkgs, lib, config, ...}: {
    options = {
      discord-hm.enable = lib.mkEnableOption "enables discord";
    };

    config = lib.mkIf config.discord-hm.enable {
      home.file.".config/Vencord".source = ../../../../dots/progs/Vencord;
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
