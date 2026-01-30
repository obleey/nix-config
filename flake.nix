{
  description = "Modular Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {
    # macOS Configuration
    darwinConfigurations."obleey" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./systems/aarch64-darwin/default.nix # Entry for Mac
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.obleey = import ./systems/aarch64-darwin/home.nix;
        }
      ];
    };
    
    # Linux/WSL Configuration (For the future)
    # homeConfigurations."obleey-linux" = home-manager.lib.homeManagerConfiguration { ... };
  };
}
