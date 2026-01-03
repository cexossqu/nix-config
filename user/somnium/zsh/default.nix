
{ config, lib, pkgs, inputs, ... }:

{

 programs.zsh = {
   enable = true;
   enableLsColors = true;
   enableCompletion = true;
   autosuggestions.enable = true;
   syntaxHighlighting.enable = true;
 };
 
 programs.starship = {
   enable = true;
   presets = [
     "tokyo-night"
     # "nerd-font-symbols"
   ];
 };

}

