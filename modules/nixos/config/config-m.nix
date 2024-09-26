{ pkgs, lib, config, ...}: {
    config = {
        # Set your time zone.
        time.timeZone = "Europe/Berlin";

        # Select internationalisation properties.
        i18n.defaultLocale = "en_US.UTF-8";

        i18n.extraLocaleSettings = {
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

        # Enable the X11 windowing system.
        services.xserver.enable = true;

        # Enable the GNOME Desktop Environment.
        services.xserver.displayManager.gdm.enable = true;
        services.xserver.desktopManager.gnome.enable = true;

        # Configure keymap in X11
        services.xserver.xkb = {
            layout = "de";
            variant = "";
        };

        # Configure console keymap
        console.keyMap = "de";

        # Enable CUPS to print documents.
        services.printing.enable = true;

        # Enable sound with pipewire.
        hardware.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        # Enable touchpad support (enabled default in most desktopManager).
        # services.xserver.libinput.enable = true;

        environment.systemPackages = with pkgs; [
          wget
          wl-clipboard
          gcc
        ];
    };
}
