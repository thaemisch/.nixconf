{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli.url = "github:t7h-dots/cli";
    stylix.url = "github:danth/stylix";
    gitzeug.url = "github:thaemisch/gitzeug";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.vscode-server.nixosModules.default
        inputs.stylix.nixosModules.stylix
        ({ config, pkgs, ... }: {
          services.vscode-server.enable = true;

          environment.systemPackages = with pkgs; [
            python3
            python3Packages.pip
          ];
        })
      ];
    };
    nixosConfigurations.mini = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/mini/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
        inputs.vscode-server.nixosModules.default
        ({ config, pkgs, ... }: {
          services.vscode-server.enable = true;

          environment.systemPackages = with pkgs; [
            python3
            python3Packages.pip
          ];
        })
      ];
    };
  };
}
