{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages =
      epkgs:
        with epkgs;
        [
          beacon
          cape
          centaur-tabs
          colorful-mode
          compiler-explorer
          consult
          corfu
          dap-mode
          dashboard
          dim
          dockerfile-mode
          elisp-autofmt
          embark
          embark-consult
          envrc
          expand-region
          flycheck
          flycheck-clang-tidy
          flycheck-projectile
          flycheck-rust
          git-modes
          git-timemachine
          hide-mode-line
          hl-todo
          ligature
          link-hint
          lsp-mode
          lsp-treemacs
          lsp-ui
          magit
          magit-lfs
          magit-todos
          marginalia
          markdown-mode
          meson-mode
          multiple-cursors
          nerd-icons
          nix-mode
          nyan-mode
          orderless
          org-modern
          perspective
          pretty-mode
          projectile
          rust-mode
          sideline-flycheck
          solo-jazz-theme
          telephone-line
          treemacs-magit
          treemacs-projectile
          vertico
          visual-regexp
          visual-regexp-steroids
          vterm
          xref
          yaml-mode
          yasnippet
          all-the-icons
        ];
  };

  programs.fish.functions = {
    vterm_printf.body = ''
      if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
          # tell tmux to pass the escape sequences through
          printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
      else if string match -q -- "screen*" "$TERM"
          # GNU screen (screen, screen-256color, screen-256color-bce)
          printf "\eP\e]%s\007\e\\" "$argv"
      else
          printf "\e]%s\e\\" "$argv"
      end'';

    vterm_prompt_end.body = "vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)";

    fish_prompt.body = ''
      printf "%b" (string join "\n" (vterm_old_fish_prompt))
      vterm_prompt_end
    '';

    vterm_cmd.body = ''
      set -l vterm_elisp ()
      for arg in $argv
          set -a vterm_elisp (printf '"%s" ' (string replace -a -r '([\\\\"])' '\\\\\\\\$1' $arg))
      end
      vterm_printf '51;E'(string join \'\' $vterm_elisp)
    '';
  };

  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    multimarkdown

    # Dev
    vscode-extensions.ms-vscode.cpptools

    # LSP
    bash-language-server
    dockerfile-language-server-nodejs
    mesonlsp
    nil
    nixpkgs-fmt
    nodePackages.vscode-json-languageserver
    nodePackages.unified-language-server
  ];
}
