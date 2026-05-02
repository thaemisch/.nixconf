{ pkgs, lib, config, inputs, ...}: 
let
  pyforcael = pkgs.python3.withPackages (ps: [
    ps.pip 
    ps.materialyoucolor
    ps.pyaudio
  ]);
in 
{
  imports = [
    ./nixvim.nix
  ];

  programs.nix-ld.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages; [ evdi ];
    blacklistedKernelModules = [ "pcspkr" ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };
  };

  networking = {
    networkmanager.enable = true;
    wireguard.enable = true;
    firewall = {
      enable = true;
      allowedUDPPorts = [ 51820 52020 ];
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    desktopManager = {
      gnome.enable = false;
    };
    displayManager = {
      gdm.enable = true;
    };
    #desktopManager.plasma6.enable = true;
    openssh.enable = true;
    pulseaudio.enable = false;
    printing.enable = true;
    flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    upower.enable = true;
  };

  console.keyMap = "us";

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = ../../dots/tt.yaml; 
    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors-white";
      size = 20;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noton Color Emoji";
      };
    };
  };

 #   fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  fonts.packages = with pkgs; [
    ibm-plex
    material-symbols
    nerd-fonts.jetbrains-mono
  ];


  virtualisation.docker.enable = true;
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["tim"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    });
  '';

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  users.users.tim = {
    isNormalUser = true;
    description = "Tim";
    extraGroups = [ "networkmanager" "wheel" "docker" "openrazer" "dialout" "libvirtd"];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };


  home-manager.backupFileExtension = "hm-backup";

  system.activationScripts.binFishSymlink = ''
    mkdir -p /bin
    ln -sfn ${pkgs.fish}/bin/fish /bin/fish
    ln -sfn ${pyforcael}/bin/python3 /bin/python3
    ln -sfn ${pyforcael}/bin/python3 /bin/python
  '';

  programs = {
    zsh.enable = true;
    fish.enable = true;
    wshowkeys.enable = true;
    hyprland.enable = true;
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

    wget
    wl-clipboard
    gcc
    polkit_gnome
    gparted
    gnome-disk-utility
    lxqt.lxqt-policykit
    docker-compose
    pulseaudio
    pipewire
    wireplumber
    pavucontrol
    pamixer
    brightnessctl
    wireguard-tools
    nodejs_22
    usbutils
    pciutils
    libnotify
    rofi
    waybar-mpris
    swww
    blueman
    # python312 and its pip package removed temporarily to avoid building
    # python3.12 docs (sphinx/docutils failure during nix build).
    vim
    cliphist
    gcc
    networkmanagerapplet
    wine
    inputs.gitzeug.packages.${pkgs.system}.gitzeug
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.default
    qt6.qtbase
    qt6.qtwayland
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtdeclarative
    libsForQt5.qtbase
    libsForQt5.qtwayland
    libsForQt5.qtsvg
    libsForQt5.qtimageformats
    libsForQt5.qtdeclarative
    libsForQt5.kirigami2
    fish
    fd
    ddcutil
    jq
    cava
    pyforcael
    gtk3
    virt-manager
    qemu_kvm
    spice
    spice-gtk
    gtk3
    libepoxy
    libglvnd
    wf-recorder
    playerctl
    hyprshot
    figlet
    upower
    upower-notify
    astal.powerprofiles
    astal.battery
    pkg-config
    openssl
    nix-output-monitor
    gemini-cli
  ];
}
