{ pkgs, ... }:
{
  wrappers.fastfetch = {
    basePackage = pkgs.fastfetch.override { x11Support = false; };
    prependFlags = [
      "--config"
      ./config.sh
      "--ascii"
      ./logo
    ];
  };
}

