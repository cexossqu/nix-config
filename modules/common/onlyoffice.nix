{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  networking.firewall.allowedTCPPorts = [8000];
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      office = {
        # ...
        image = "onlyoffice/documentserver";
        autoStart = true;
        pull = "always";
        ports = [
          "8000:80"
        ];
        networks = [
          "host"
        ];

        # cmd = [
        #   "supervisorctl start ds:example && sed 's,autostart=false,autostart=true,' -i /etc/supervisor/conf.d/ds-example.conf"
        # ];
        environment = {
          JWT_SECRET = "false";
          JWT_HEADER = "Authorization";
        };
        volumes = [
          "/app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice"
          "/app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data"
          "/app/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice"
          "/app/onlyoffice/DocumentServer/db:/var/lib/postgresql"
        ];
        extraOptions = [
          # "--network host"
        ]; # 其他 Docker 选项
      };
    };
  };
}
