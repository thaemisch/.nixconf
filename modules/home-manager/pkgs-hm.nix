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
            fzf
            neofetch
            onefetch
            tmux
            glow
            aria2
            imagemagick
            yt-dlp
            # terms
            warp-terminal
            # git
            git
            gh
            # gui utils
            gscreenshot
            flameshot
            hyprpicker
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
            # video
            vlc
            # misc
            arduino-ide
            processing
            # ides
            vscode
            zed-editor
        ];
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
            clock = "tty-clock -scD";
          };
          initExtra = "eval $(thefuck --alias)\n";
          autosuggestion.enable = true;
          enableCompletion = true;
          oh-my-zsh = {
            enable = true;
            theme = "agnoster";
          };
        };
        programs.kitty = {
            enable = true;
            settings = {
            #hide_window_decorations = true;
            window_padding_width = 10;
            wayland_titlebar_color = "background";
            background_opacity = lib.mkForce "1";
            };
        };
        programs.ghostty = {
            enable = true;
            enableZshIntegration = true;
            settings = {
              background-blur = true;
              background-opacity = "0.8";
              window-padding-x = "8";
              window-padding-y = "8";
              window-decoration = "none";
              clipboard-read = "allow";
              clipboard-write = "allow";
              clipboard-trim-trailing-spaces = true;
            };
        };
    };
}
