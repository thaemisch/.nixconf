{ pkgs, lib, config, ...}: {
    options = {
      ghostty-hm.enable = lib.mkEnableOption "enables ghostty";
    };

    config = lib.mkIf config.ghostty-hm.enable {
        programs.ghostty = {
            enable = true;
            enableZshIntegration = true;
            settings = {
              background-blur = true;
              background-opacity = "0.8";
              window-padding-x = "8";
              window-padding-y = "8";
              window-decoration = "none";
              clipboard-read = "allow";
              clipboard-write = "allow";
              clipboard-trim-trailing-spaces = true;
            };
        };
    };
}
