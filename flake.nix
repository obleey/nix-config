{
  description = "Obleey's Modular Nix-Darwin Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: 
  let
    user = "obleey";
    # Builder function to avoid repeating code for every Mac
    mkDarwin = { hostname }: nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit inputs user hostname; }; 
      modules = [
        ./systems/aarch64-darwin/default.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs user hostname; };
          home-manager.users.${user} = import ./systems/aarch64-darwin/home.nix;
        }
      ];
    };
  in {
    darwinConfigurations = {
      "obleey"      = mkDarwin { hostname = "obleey"; };      # Personal
      "obleey-work" = mkDarwin { hostname = "obleey-work"; }; # Work
    };
  };
}