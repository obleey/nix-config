{ config, pkgs, user, hostname, ... }: 
let 
  allPkgs = import ../../common/packages.nix { inherit pkgs; };
in
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";

  imports = [
    ../../common/zsh
    ../../common/ghostty
    ../../common/vscode
    ../../common/starship
    ../../common/fzf
    ../../common/zoxide
    ../../common/neovim
    ../../common/ssh
    ../../common/git 
  ];

  # Handle packages here so you don't repeat this block in every host
  home.packages = allPkgs.shared 
    ++ (if hostname == "obleey-work" then allPkgs.work else allPkgs.personal);

  home.file."Library/Application Support/Cursor/User/settings.json".source = 
    config.lib.file.mkOutOfStoreSymlink "/Users/${user}/Library/Application Support/Code/User/settings.json";

  home.stateVersion = "24.11";
}