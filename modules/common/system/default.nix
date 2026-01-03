
{ config, lib, pkgs, ... }:

{

  imports = lib.custom.scanPaths ./.;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "pipe-operators" ];
      trusted-users = [ "somnium" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "chaos"; # Define your hostname.

  system.stateVersion = "25.05"; # Did you read the comment?

}

