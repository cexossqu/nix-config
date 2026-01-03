{ pkgs, config, username, inputs, ... }:
{
  imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak = {
      enable = true;
      packages = [
         { appId = "com.tencent.WeChat"; origin = "flathub";  }
      ];
  };

}

