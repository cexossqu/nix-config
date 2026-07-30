{
  config,
  options,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  # 启用 evremap 服务
  services.evremap = {
    enable = true;
    settings = {
      # 指定要重映射的设备名称
      device_name = "你的鼠标设备名";
      remap = [
        {
          # 将鼠标侧键 BTN_SIDE 映射为左键 BTN_LEFT
          #input = ["BTN_SIDE"];
          # output = ["BTN_LEFT"];
        }
        # 可以添加更多映射规则
        # {
        #   input = [ "BTN_EXTRA" ];
        #   output = [ "KEY_LEFTMETA" "KEY_Z" ]; # 映射为快捷键 Win+Z
        # }
      ];
    };
  };
}
