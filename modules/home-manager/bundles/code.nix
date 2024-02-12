{ pkgs, config, lib, ... }:

# Module containing all gaming packages

let
  cfg = config.code;
in {

  options.code = {
    enable = lib.mkEnableOption "enable coding module";
  };

  config = lib.mkIf cfg.enable {
    #Android dev stuff
    programs.adb.enable = true;
    users.users.lukas.extraGroups = ["adbusers"];

    home.packages = with pkgs; [
        onlyoffice-bin

    ];
  };

}
