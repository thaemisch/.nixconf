{ pkgs, lib, config, ...}: {
    options = {
      kitty-hm.enable = lib.mkEnableOption "enables kitty";
    };

    config = lib.mkIf config.kitty-hm.enable {
        programs.kitty = {
            enable = true;
            settings = {
            #hide_window_decorations = true;
            window_padding_width = 10;
            wayland_titlebar_color = "background";
            background_opacity = lib.mkForce "1";
            };
        };
    };
}
