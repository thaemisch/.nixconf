{ pkgs, lib, config, ...}: {
  options = {
    stylix-nm.enable = lib.mkEnableOption "enables stylix";
  };

  config = lib.mkIf config.stylix-nm.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
      image = ../../../dots/wallpapers/wallpaper.png;
      cursor = {
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-cursors-white";
      };

      fonts = {
        monospace = {
          package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
          name = "JetBrainsMono Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
        };
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noton Color Emoji";
        };
      };
    };
  };
}
