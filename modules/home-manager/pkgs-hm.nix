{ pkgs, lib, config, ...}: {
    config = {
        nixpkgs.config.allowUnfree = true;

        home.packages = with pkgs; [
            # ai
            uv
            claude-code
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
            fastfetch
            onefetch
            tmux
            glow
            aria2
            imagemagick
            yt-dlp
            # git
            git
            gh
            # gui utils
            gscreenshot
            flameshot
            hyprpicker
            # browsers
            google-chrome
            # notes
            obsidian
            xournalpp
            rnote
            lorien
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
            multiviewer-for-f1
            teamspeak6-client
            # ides
            vscode
            antigravity
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
            gz = "gitzeug";
          };
          autosuggestion.enable = true;
          enableCompletion = true;
          zplug = {
            enable = true;
            plugins = [
              { name = "MichaelAquilina/zsh-auto-notify"; }
            ];
          };
          oh-my-zsh = {
            enable = true;
            plugins = [ "git" "web-search" "themes" "tailscale" "sudo" "safe-paste" "rust" "extract" "wd" ];
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
              background-opacity = "0.95";
              window-padding-x = "2";
              window-padding-y = "5";
              window-padding-color = "extend";
              window-decoration = "none";
              clipboard-read = "allow";
              clipboard-write = "allow";
              clipboard-trim-trailing-spaces = true;
            };
        };
    };
}
