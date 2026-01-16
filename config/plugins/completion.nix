{ ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        signature = {
          enabled = true;
        };
        completion = {
          documentation = {
            auto_show = true;
          };
          accept = {
            auto_brackets = {
              enabled = false;
            };
          };
          ghost_text = {
            enabled = true;
          };
          trigger = {
            show_on_backspace_in_keyword = true;
          };
        };
        keymap = {
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-e>" = [
            "hide"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-y>" = [
            "select_and_accept"
          ];
          "<Down>" = [
            "select_next"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];
        };
      };
    };
  };
}
