{ pkgs, config, lib, ... }:

# Module containing all gaming packages

let
  cfg = config.gaming;
in {

  options.gaming = {
    enable = lib.mkEnableOption "enable gaming module";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    home.packages = with pkgs; [
      lutris
      heroic
      steam
      steam-run
      protonup-qt
      gamemode
      gamescope
      mangohud
      steamPackages.steam-runtime
    ];
  };

}
