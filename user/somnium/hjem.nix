
{ config, lib, pkgs, inputs, ... }:

{

#  imports = lib.custom.scanPaths ./.;
  imports = [
    inputs.hjem.nixosModules.default
  ];
  hjem.users = {
    somnium = {
      clobberFiles = true;
      enable = true; # This is not necessary, since enable is 'true' by default
      user = "somnium"; # this is the name of the user
      directory = "/home/somnium"; # where the user's $HOME resides
      files = {
      };
    };
  };

}

