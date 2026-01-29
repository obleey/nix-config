{
  description = "Obleey's Modular Nix-Darwin System";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    darwinConfigurations."obleey" = nix-darwin.lib.darwinSystem {
      # We pass 'inputs' so your modules can access them if needed
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/obleey.nix
      ];
    };
  };
}
