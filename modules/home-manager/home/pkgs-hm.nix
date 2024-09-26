{ pkgs, lib, config, ...}: {
    config = {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            # cli utils
            unzip
            neovim
            bat
            scc
            eza
            duf
            hyperfine
            btop
            gping
            speedtest-cli
            thefuck
            fzf
            neofetch
            onefetch
            tmux
            # gui utils
            gscreenshot
            eyedropper
            # browsers
            google-chrome
            #music
            spotify
        ];
    };
}
