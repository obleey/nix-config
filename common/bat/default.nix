{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      # 'map-syntax' lets you treat weird file extensions as code
      map-syntax = [
        "*.jenkinsfile:Groovy"
        "*.nix:nix"
      ];
      theme = "base16"; # This usually plays nicer with custom terminal colors
    };
    # You can even add extra themes or syntaxes here!
  };
}
