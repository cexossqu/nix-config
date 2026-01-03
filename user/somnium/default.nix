
{ config, lib, pkgs, inputs, ... }:

{

#  imports = lib.custom.scanPaths ./.;
  imports = [
    ./hjem.nix
    ./zsh
  ];
  users = {
    users.somnium = {
      isNormalUser = true;
      shell = pkgs.zsh;
      home = "/home/somnium";
      uid = 1000;
      group = "somnium";
      extraGroups = [ "wheel" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];
    };
    groups = {
      somnium = {
        members = [ "somnium" ];
        gid = 1000;
      };
    };
  };


}

