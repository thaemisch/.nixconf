{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs: { 
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {      
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/configuration.nix 
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {      
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/configuration.nix 
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {      
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/wsl/configuration.nix 
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
