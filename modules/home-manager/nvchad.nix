{ inputs, pkgs, ... }: {
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      pyright
      gopls
      rust-analyzer
      typescript-language-server
      bash-language-server
    ];
    hm-activation = true;
    backup = false;
  };
}
