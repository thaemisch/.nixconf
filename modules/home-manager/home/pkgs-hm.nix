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
            glow
            aria2
            # gui utils
            gscreenshot
            eyedropper
            # browsers
            google-chrome
            floorp
            # music
            spotify
            # notes
            obsidian
            # comms
            whatsie
            whatsapp-for-linux
        ];
    };
}
