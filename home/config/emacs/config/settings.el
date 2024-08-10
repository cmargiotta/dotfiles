;; Enable mouse in term-mode
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  ;; let terminal emacs use system clipboard
  ;; check out the xclip package if this doesn't work
  (setq xterm-extra-capabilities '(getSelection setSelection)))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq make-backup-files nil       ; stop creating ~ files
      auto-save-default nil       ; Disable autosave # files
      create-lockfiles nil        ; Disable .# files

      frame-resize-pixelwise t ; Better frame resizing
      use-dialog-box nil

      inhibit-startup-screen 't
      inhibit-startup-message 't

      use-short-answers 't ; Set y or n instead of yes or no for questions

      ;; Scroll settings
      scroll-preserve-screen-position 't
      pixel-scroll-precision-mode t
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse t ;; scroll window under mouse
      mouse-wheel-tilt-scroll t
      scroll-margin 7
      scroll-conservatively 101

      message-log-max nil
      warning-minimum-level :error

      ;; Editor settings
      tab-width 2
      indent-tabs-mode nil ; use spaces not tabs
      truncate-lines t     ; Allow truncated lines
      blink-cursor-mode nil
      display-line-numbers-type 'absolute

      ;; Prevent emacs from trying to write to init.el
      custom-file (concat user-emacs-directory "trash.el"))

;; Use cat as a pager. Fixes all kinds of things.
(setenv "PAGER" "cat")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(cua-mode)
(global-auto-revert-mode 1)
(electric-pair-mode nil) ; No auto closing pairs like () and {}
(global-hl-line-mode) ; Highlight the current line
(electric-indent-mode 't) ; Auto Indent
(global-display-line-numbers-mode 1) ; Display line numbers
