{ pkgs, ... }:

{
  programs.neovim =
  let
    vimrc = builtins.readFile ./vimrc;
    coc-settings = builtins.fromJSON (builtins.readFile ./coc-settings.json);
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;

    coc = {
      enable = true;
      settings = coc-settings;
    };

    plugins = with pkgs.vimPlugins; [
      vim-nix

      gruvbox
      vim-airline

      coc-clangd
      coc-cmake
      coc-json

      vim-lsp-cxx-highlight
    ];

    extraConfig = vimrc;
  };
}
