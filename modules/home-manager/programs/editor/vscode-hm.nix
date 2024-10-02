{ pkgs, lib, config, ...}: {
    options = {
      vscode-hm.enable = lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.vscode-hm.enable {
      nixpkgs.config.allowUnfree = true;
      home.packages = with pkgs; [
        vscode
      ];
    };
}
