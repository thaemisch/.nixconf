{ pkgs, lib, config, ...}: {
    options = {
      vscode-hm.enable = lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.vscode-hm.enable {
        programs.vscode = {
            enable = true;
        };
    };
}
