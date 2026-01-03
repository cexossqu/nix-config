
{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
}
