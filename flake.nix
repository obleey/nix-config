{
  description = "Macbook configs - work and personal";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-os-utils.url = "github:hraban/mac-app-util";
    mac-os-utils.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      mac-os-utils,
      nix-vscode-extensions,
      nix-homebrew,
      ...
    }:
    let
      user = "obleey";
      # Helper to build configurations for different hosts
      mkDarwin =
        {
          hostname,
          hostFolder,
          user,
        }:
        builtins.trace
          "🚀 EVALUATING CONFIGURATION: Host=[${hostname}] Folder=[${hostFolder}] User=[${user}]"
          nix-darwin.lib.darwinSystem
          {
            system = "aarch64-darwin";
            specialArgs = { inherit inputs user hostname; };
            modules = [
              # Pointing to the NEW host directory for system settings
              ./hosts/${hostFolder}/default.nix

              # Apply nix-vscode-extensions overlay so pkgs has latest marketplace extensions
              { nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ]; }
              home-manager.darwinModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs user hostname; };
                # Pointing to the NEW host directory for user settings
                home-manager.users.${user} = import ./hosts/${hostFolder}/home.nix;
              }
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  enable = true;
                  enableRosetta = true;
                  user = user;
                  autoMigrate = true;

                };
              }
            ];
          };
    in
    {
      darwinConfigurations = {
        # "hostname" = mkDarwin { hostname = "hostname"; hostFolder = "folder"; };
        "obleey-macbook" = mkDarwin {
          hostname = "obleey-macbook";
          hostFolder = "personal";
          user = "obleey";
        };
        "obleey-work" = mkDarwin {
          hostname = "obleey-work";
          hostFolder = "work";
          user = "miha.oblisar";
        };
      };
    };
}
