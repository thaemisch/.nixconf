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
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.vscode-server.nixosModules.default
        inputs.stylix.nixosModules.stylix
        # Added `inputs` to module arguments below
        ({ config, pkgs, inputs, ... }: {
          services.vscode-server.enable = true;

          environment.systemPackages = with pkgs; [
            python3
            python3Packages.pip
            # Explicitly reference inputs.antigravity-nix
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-ide
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
          ];
        })
      ];
    };

    nixosConfigurations.mini = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/mini/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
        inputs.vscode-server.nixosModules.default
        # Added `inputs` to module arguments below
        ({ config, pkgs, inputs, ... }: {
          services.vscode-server.enable = true;

          environment.systemPackages = with pkgs; [
            python3
            python3Packages.pip
            # Explicitly reference inputs.antigravity-nix
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-ide
            inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
          ];
        })
      ];
    };
  };
}