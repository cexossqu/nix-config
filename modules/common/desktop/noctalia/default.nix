{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{
   environment.systemPackages = with pkgs; [
       inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
       swaylock
  ];
}

