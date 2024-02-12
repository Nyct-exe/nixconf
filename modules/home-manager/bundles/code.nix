{ pkgs, config, lib, ... }:

# Module containing all gaming packages

let
  cfg = config.code;
in {

  options.code = {
    enable = lib.mkEnableOption "enable coding module";
  };

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
        android-studio
        jetbrains-toolbox
        scanmem
    ];
  };

}
