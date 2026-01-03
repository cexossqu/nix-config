
{ config, lib, pkgs, inputs, ... }:

{


  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neofetch
    # alacritty
    fuzzel
    my-google-chrome
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight
  ];

}

