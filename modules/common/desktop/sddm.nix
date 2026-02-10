{
  config,
  options,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
    #themeConfig = {
    #  Background = "path/to/background.jpg";
    #  Font = "M+1 Nerd Font";
    #};
  };
in {
  services.displayManager.sddm = {
    enable = false;
    wayland.enable = true;
    enableHidpi = true;
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
    extraPackages = with pkgs; [
      custom-sddm-astronaut
    ];
  };
  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
  ];
}
