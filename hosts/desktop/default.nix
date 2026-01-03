{ pkgs, config, username, ... }:
{
  imports = [
    ./../../modules/common
    ./../../user/${username}
  ];

  powerManagement.cpuFreqGovernor = "performance";

}

