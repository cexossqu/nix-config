# 字体配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{

   environment.systemPackages = with pkgs; [
    xwayland
    xwayland-run
    xorg.xsetroot
    xorg.libxcb
    swaybg
    base16-schemes
    #xwaylandvideobridge
    labwc
    xwayland-satellite
    wlr-randr
  ];
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  xdg.autostart.enable = true;

}

