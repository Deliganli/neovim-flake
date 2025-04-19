{ ... }:
{
  globals.mapleader = ",";

  enableMan = true;

  globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Search
    ignorecase = true;
    smartcase = true;

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 2;
    shiftwidth = 2;
    shiftround = true;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    showmatch = true;
    clipboard = "unnamedplus"; # System clipboard, needs xclip/wl-clipboard
    cursorline = true; # Highlight the current line
    ruler = true; # Show line and column when searching
    gdefault = true; # Global substitution by default
    scrolloff = 10; # X lines away from the top/bottom
    sidescrolloff = 8; # X lines away from the left/right
    termguicolors = true; # 24-bit RGB
    list = true; # Show tab, trailing spaces etc
    spell = true; # Spellcheck

    splitbelow = true;
    splitright = true;
    laststatus = 3; # Always visible

    # completeopt = "menu,menuone,noselect,preview"; # insert mode completion
  };

  userCommands = {
    Q = {
      command = "q";
      bang = true;
    };
  };

  filetype = {
    extension = {
      jinja = "jinja";
      jinja2 = "jinja";
      j2 = "jinja";
    };
  };

  autoCmd = [
    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "**/{ansible,playbooks}/**.{yml,yaml}"
      ];
      command = "set filetype=yaml.ansible";
    }
  ];
}
