{
  description = "Obleey's Modular Nix-Darwin System";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Add Home Manager input
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."obleey" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./hosts/obleey.nix
        ./modules/core.nix
        ./modules/macos.nix
        
        # Add Home Manager as a module
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.obleey = import ./modules/home.nix;
        }
      ];
    };
  };
}
