{ ... }: {
  nix.settings = {
    # Only useful on Apple Silicon to run Intel apps
    extra-platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}