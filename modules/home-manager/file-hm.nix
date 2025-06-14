{ pkgs, lib, config, ...}: {
    config = {
        home.file = {
            ".config/rofi".source = ../../dots/hyprland/rofi;
            ".config/fish".source = ../../dots/fish;
        };
    };
}
