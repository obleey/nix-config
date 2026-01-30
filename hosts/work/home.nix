{ pkgs, user, hostname, ... }: {
  imports = [ ../../systems/aarch64-darwin/home-base.nix ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Miha Oblišar (Work)";
        email = "miha.oblishar@company.com"; # Replace with work email
      };
      # Example of work-specific github user
      github.user = "obleey-work-profile";
    };
  };

 programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "/Users/${user}/.ssh/id_ed25519_work";
      };
    };
  };
}