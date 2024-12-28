{ pkgs, lib, ... }:
{
  home.file = {
    ".emacs.d/early-init.el".source = ./config/emacs/early-init.el;
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

  programs.emacs = {
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = pkgs.writeTextFile {
        name = "init.el";
        text = lib.concatStrings [
          (lib.concatMapStringsSep "\n" builtins.readFile [
            ./config/emacs/config/bindings.el
            ./config/emacs/config/completion.el
            ./config/emacs/config/dashboard.el
            ./config/emacs/config/editor.el
            ./config/emacs/config/git.el
            ./config/emacs/config/hooks/cpp_header_guards.el
            ./config/emacs/config/hooks.el
            ./config/emacs/config/languages.el
            ./config/emacs/config/org.el
            ./config/emacs/config/packages.el
            ./config/emacs/config/settings.el
            ./config/emacs/config/theming.el
            ./config/emacs/config/treemacs.el
          ])

          ''
            (with-eval-after-load 'lsp-mode
               (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
               (setq dap-cpptools-debug-path "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/")
               (setq dap-cpptools-debug-program (list "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7"))
               (require 'dap-cpptools))
          ''
        ];
      };

      extraEmacsPackages = epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
      ];

      defaultInitFile = true;
      package = pkgs.emacs-pgtk;
      alwaysEnsure = true;
    });
  };

  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    multimarkdown

    # LSP
    bash-language-server
    dockerfile-language-server-nodejs
    mesonlsp
    nil
    nixpkgs-fmt
    nixfmt-rfc-style
    nodePackages.vscode-json-languageserver
    nodePackages.unified-language-server
  ];
}
