{ pkgs, lib, config, ...}: {
    imports = [
        ./_enables
        ./config
        ./style
        ./wm
    ];
}
