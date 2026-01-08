{ ... }:
{
  imports = [
    ./general.nix
    ./keymappings.nix
    ./lsp.nix
    ./plugins
  ];

  dependencies = {
    tree-sitter.enable = true;
  };
}
