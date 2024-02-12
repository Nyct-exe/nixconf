{ pkgs, ... }: {
    home.packages = with pkgs; [
        btop
        vscode
        thefuck
        nvtop-amd
        wget
        spotify
        lm_sensors
    ];    
}
