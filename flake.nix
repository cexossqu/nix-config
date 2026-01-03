{
  description = "A template that shows all standard flake outputs";

  nixConfig = {
    extra-experimental-features = ["pipe-operators"];
  };

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    niri.url = "github:sodiboo/niri-flake";
    wrapper-manager.url = "github:viperML/wrapper-manager";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    hjem.url = "github:feel-co/hjem";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    somnium-nixnvim = {
      url = "github:cexossqu/Nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
      ];
    };
    lib = nixpkgs.lib.extend (self: super: {custom = import ./lib {inherit (nixpkgs) lib;};});
    username = "somnium";
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/desktop
        ];
        specialArgs = {
          host = "desktop";
          inherit self inputs lib username;
        };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          host = "laptop";
          inherit self inputs lib username;
        };
        modules = [
          ./hosts/laptop
        ];
      };
    };
  };
}
