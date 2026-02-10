{
  pkgs,
  config,
  username,
  inputs,
  ...
}: {
  hardware.steam-hardware.enable = true;
  environment.systemPackages = with pkgs; [
    steam-run
  ];
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    package = pkgs.steam.override {
      # withPrimus = true;
      # withJava = true;
      extraEnv = {
        SDL_VIDEODRIVER = "x11";
      };
      extraPkgs = pkgs:
        with pkgs; [
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          source-sans
          source-serif
          source-han-sans
          source-han-serif
          xwayland
          xwayland-run
          bumblebee
          mesa-demos
        ];
    };
    fontPackages = with pkgs; [
      dejavu_fonts
      hack-font
      font-awesome_5
      font-awesome
      line-awesome
      liberation_ttf
      roboto
      ubuntu-classic
      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-code-pro
      source-sans-pro
      source-serif-pro
      source-han-sans
      source-han-mono
      source-han-serif
      wqy_microhei
      wqy_zenhei
      #  nerdfonts
      jetbrains-mono
    ];
    extraPackages = with pkgs; [gamescope];
    gamescopeSession.enable = true;
  };
  programs.java.enable = true;
}
