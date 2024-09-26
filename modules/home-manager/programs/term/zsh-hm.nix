{ pkgs, lib, config, ...}: {
    config = {
        programs.zsh = {
          enable = true;
          shellAliases = {
            c = "clear";
            s = "sudo";
            sv = "sudo nvim";
            v = "nvim";
            vim = "nvim";
            cl = "clear && pwd && eza -la --icons=always";
            cdc = "cd && clear";
            nc-flake = "nvim ~/.nixconf/flake.nix";
            nc = "cd ~/.nixconf";
            ncm = "cd ~/.nixconf/modules";
            ncmn = "cd ~/.nixconf/modules/nixos";
            ncmh = "cd ~/.nixconf/modules/home-manager";
            ncd = "cd ~/.nixconf/dots/";
            ncgit = "cd ~/.nixconf && sudo git add . && git commit -m \"auto commit\" && git push";
          };
          initExtra = "eval $(thefuck --alias)\n";
          autosuggestion.enable = true;
          enableCompletion = true;
          oh-my-zsh = {
            enable = true;
            theme = "agnoster";
          };
        };
    };
}
