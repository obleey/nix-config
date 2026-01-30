{ pkgs, ... }: {
  imports = [ ./settings.nix ];

  programs.vscode = {
    enable = true;
    # Force Home Manager to use the latest unstable VS Code package
    package = pkgs.vscode;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        ms-azuretools.vscode-docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-vscode-remote.vscode-remote-extensionpack
        redhat.vscode-yaml
        jnoortheen.nix-ide
      ];
    };
  };
}