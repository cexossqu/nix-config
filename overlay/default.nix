{ config, pkgs, lib, inputs, ... }:
let

# other-overalys = lib.custom.scanPaths ./.;

in
{
  nixpkgs.overlays = [
    ( final: prev:
   	    let
             wrapper-manager = inputs.wrapper-manager;
             evald = wrapper-manager.lib {
               pkgs = prev;
               modules =
               builtins.readDir ../wrapper-manager
               |> builtins.attrNames
               |> map (n: ../wrapper-manager/${n});
             };
           in
           builtins.mapAttrs (_: value: value.wrapped) evald.config.wrappers
     )
     (self: super: {
      	  my-google-chrome = super.google-chrome.override {
          };
      })
    (import ./fcitx5)
  ] ;
}
