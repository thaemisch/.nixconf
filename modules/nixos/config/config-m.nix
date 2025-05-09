{ pkgs, lib, config, inputs, ...}: {
  config = {
    gui-nm.enable = true;

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
        allowedUDPPorts = [ 51820 ];
      };
    };

    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = false;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      openssh.enable = true;
      pulseaudio.enable = true;
      printing.enable = true;
      rtkit.enable = true;
      flatpak.enable = true;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };

    console.keyMap = "us";

    fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];


    virtualisation.docker.enable = true;

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
      extraGroups = [ "networkmanager" "wheel" "docker" "openrazer" "dialout"];
      packages = with pkgs; [
      ];
      shell = pkgs.zsh;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    programs.zsh.enable = true;
    programs.wshowkeys.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
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
    ];
  };
}
