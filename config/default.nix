{ ... }:
{
  imports = [
    ./general.nix
    ./keymappings.nix
    ./lsp.nix
    ./plugins/completion.nix
    ./plugins/fzf-lua.nix
    ./plugins.nix
  ];
}
