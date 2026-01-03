{ config, options, lib, pkgs, ... }: 

{

  services.openssh.enable = true;
  services.openssh = {
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
  };

}

