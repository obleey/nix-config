{ ... }:
{
  programs.starship = {
    enable = true;
    # These settings are automatically converted to starship.toml by Nix
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$kubernetes$terraform$character";

      directory = {
        truncation_length = 3;
        fish_style_pwd_dir_length = 1;
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
