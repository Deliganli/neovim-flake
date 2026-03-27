# My Neovim Nix config

For scala development, but have others as well

You can try it like;

```bash
nix run github:Deliganli/neovim-flake
```

Can be added to NixOS configuration as well. First, add the input into your flake;

```nix
inputs = {
  neovim-flake = {
    url = "github:Deliganli/neovim-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

Then include the package below into somewhere, perhaps as a system package, like below;

```nix
environment.systemPackages = with pkgs; [
  inputs.neovim-flake.packages."${pkgs.system}".default
];
```

## Extend on Nix

Config can be extended like below;

```nix
let
  system = pkgs.stdenv.hostPlatform.system;
  extendedConf = inputs.neovim-flake.nixvimConfigurations.${system}.default.extendModules {
    modules = [
      config.stylix.targets.nixvim.exportedModule
      {
        lsp.servers = {
          nixd = {
            enable = true;

            config =
              let
                flakeOf = dir: ''(builtins.getFlake "/Users/me/${dir}")'';
                nixDir = flakeOf "nix";
              in
              {
                settings.nixd = {
                  nixpkgs = {
                    expr = "import ${nixDir}.inputs.nixpkgs { }";
                  };
                  options = rec {
                    nix-darwin.expr = "${nixDir}.darwinConfigurations.${config.networking.hostName}.options";
                    nixvim.expr = "${flakeOf "neovim-flake"}.nixvimConfigurations.${system}.default.options";
                    home-manager.expr = "${nix-darwin.expr}.home-manager.users.type.getSubOptions [ ]";
                  };
                };
              };
          };
        };
      }
    ];
  };
in
{
  environment = {
    systemPackages = [
      extendedConf.config.build.package
    ];
  };
}
```
