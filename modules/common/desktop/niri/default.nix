{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{
    imports = [
        inputs.niri.nixosModules.niri
    ];
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri.package = pkgs.niri-unstable; 
    niri-flake.cache.enable = true;
    programs.niri.enable = true;
    hjem.users.somnium = {
        files = {
            ".config/niri/config.kdl".source = ./config.kdl;
        };
    };
    environment.sessionVariables = {
        XMODIFIERS = "@im=fcitx";
    };
}

