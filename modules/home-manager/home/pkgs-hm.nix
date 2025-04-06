{ pkgs, lib, config, ...}: {
    config = {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            # cli utils
            unzip
            neovim
            tty-clock
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
            # terms
            warp-terminal
            # git
            git
            gh
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
            xournalpp
            rnote
            lorien
            # comms
            whatsie
            whatsapp-for-linux
            # files
            nautilus
            # virtualisation
            bottles
            distrobox
            # images
            rawtherapee
            darktable
            eog
            # misc
            arduino-ide
        ];
    };
}
