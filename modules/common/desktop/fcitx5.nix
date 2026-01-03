# 字体配置
{
  config,
  options,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-lua
      fcitx5-gtk
      fcitx5-mozc
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-chinese-addons
      kdePackages.fcitx5-qt
      xh-fcitx5-rime
    ];
  };

  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "Default";
    "Groups/0" = {
      Name = "Default";
      "Default Layout" = "us";
      DefaultIM = "keyboard-us";
    };
    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "rime";
  };
  i18n.inputMethod.fcitx5.settings.addons = {
    classicui.globalSection.Theme = "catppuccin-mocha-mauve";
  };

  # catppuccin的flake,option
  catppuccin.fcitx5 = {
    enable = true;
    flavor = "mocha"; # 主题变体
    accent = "mauve"; # 强调色
    enableRounded = true; # 启用圆角
  };
}
