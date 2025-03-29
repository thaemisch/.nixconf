{ pkgs, lib, config, ...}: {
    options = {
      zed-hm.enable = lib.mkEnableOption "enables zed-editor";
    };

    config = lib.mkIf config.vscode-hm.enable {
      nixpkgs.config.allowUnfree = true;
      home.packages = with pkgs; [
        zed-editor
      ];
    };
}
