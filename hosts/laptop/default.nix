{ pkgs, config, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/common
    ./../../user/${username}
    ./../../overlay
    ./../../modules/flatpak.nix
    ./power.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";

}

