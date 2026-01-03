
{ config, lib, pkgs, inputs, ... }:

{


  environment.systemPackages = with pkgs; [
    inputs.somnium-nixnvim.packages."${stdenv.hostPlatform.system}".default
  ];

}

