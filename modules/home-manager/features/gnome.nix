{ lib, pkgs, config, ... }:

# Module meant for configuration of gtk and other gnome prefrences

let
   cfg = config.gnome; 
in {

    options.gnome = {
        enable = lib.mkEnableOption "enable gnome config";
    };

    config = lib.mkIf cfg.enable {
        gtk = {
        enable = true;

        iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
        };

        cursorTheme = {
        name = "Numix-Cursor";
        package = pkgs.numix-cursor-theme;
        };

    };


    # Prefered Gnome Settings (USE "dconf watch /" to figure out changes in the gnome settings config)
    dconf.settings = {
        "org/gnome/shell" = {
            favorite-apps = [
                "org.gnome.Nautilus.desktop"
                "spotify.desktop"
                "discord.desktop"
                "steam.desktop"
                "firefox.desktop"
                "org.gnome.Console.desktop"
            ];
        };
        "org/gnome/mutter" = {
            edge-tiling = true;
        };
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
        # Bring back top right window buttons
        "org/gnome/desktop/wm/preferences" = {
            button-layout = ":minimize,maximize,close";
        };
        # EXTENTIONS
        # Dash To Panel Preffered Settings
        "org/gnome/shell/extensions/dash-to-panel" = {
            panel-sizes = ''{"0":24,"1":24}'';
            multi-monitors = false;
            appicon-margin = 0;
            panel-positions = ''{"0":"TOP","1":"TOP"}'';
            panel-element-positions = ''{"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"centered"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"centered"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'';
        };

        "org/gnome/shell" = {
            disable-user-extensions = false;
            # `gnome-extensions list` for a list
            enabled-extensions = [
                "user-theme@gnome-shell-extensions.gcampax.github.com"
                "trayIconsReloaded@selfmade.pl"
                "Vitals@CoreCoding.com"
                "space-bar@luchrioh"
                "quick-settings-tweaks@qwreey"
                "blur-my-shell@aunetx"
                "dash-to-panel@jderose9.github.com"
            ];
        };
        # Gradiance Requires Manual download and theming
        "com/github/GradienceTeam/Gradience" = {
            enabled-plugins = ["firefox_gnome_theme"];
        };
    };

    home.packages = with pkgs; [
        gnomeExtensions.user-themes
        gnomeExtensions.tray-icons-reloaded
        gnomeExtensions.vitals
        gnomeExtensions.space-bar
        gnomeExtensions.quick-settings-tweaker
        gnomeExtensions.blur-my-shell
        gnomeExtensions.dash-to-panel
        gradience
    ];
};
    
    
}