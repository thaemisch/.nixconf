{ pkgs, lib, config, ...}: {
    config = {
        home.file = {
            ".config/nvim".source = ../../../dots/nvim;
        };
    };
}