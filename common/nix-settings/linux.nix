{ pkgs, ... }: {
  # Linux-specific Nix optimizations
  nix = {
    settings = {
      # Allow the Nix daemon to run with low priority to not lag the system
      daemon-ionice-level = 1;
      daemon-nice-level = 19;
      
      # Sandbox builds for security (Standard on Linux, often default)
      sandbox = true;
    };

    # Automatic Garbage Collection (Keep your Linux disk clean)
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Linux systems need this to allow "unfree" packages via the CLI
  nixpkgs.config.allowUnfree = true;
}