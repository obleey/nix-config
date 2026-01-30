{ config,pkgs, ... }: {
  home.username = "obleey";
  home.homeDirectory = "/Users/obleey";
  
  imports = [
    ../../common/zsh
    ../../common/ghostty
    ../../common/vscode
    ../../common/starship # <--- Add this
    ../../common/fzf
    ../../common/zoxide
    ../../common/neovim
    ../../common/ssh
    ../../common/git
  ];

  home.file."Library/Application Support/Cursor/User/settings.json".source = 
  config.lib.file.mkOutOfStoreSymlink "/Users/obleey/Library/Application Support/Code/User/settings.json";

  home.stateVersion = "24.11";
}
