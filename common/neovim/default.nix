{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;   # This handles 'vi'
    vimAlias = true;  # This handles 'vim'
    vimdiffAlias = true;
    defaultEditor = true; # This sets the $EDITOR variable to nvim

    # Install the Catppuccin plugin and Tree-sitter for syntax
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      nvim-treesitter.withAllGrammars
    ];

    extraPackages = with pkgs; [
      tree-sitter
    ];

    # Apply the Catppuccin Macchiato theme (matches your Ghostty)
    extraConfig = ''
      lua << EOF
      require("catppuccin").setup({
          flavour = "macchiato",
          transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
      EOF
      set number relativenumber " Hybrid line numbers
      set shiftwidth=2 tabstop=2 expandtab
    '';
  };
}
