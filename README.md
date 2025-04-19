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

I don't know how to make a `nixosModule` or `homeManagerModule` yet
