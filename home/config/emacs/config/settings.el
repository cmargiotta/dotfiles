;; Enable mouse in term-mode
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  ;; let terminal emacs use system clipboard
  ;; check out the xclip package if this doesn't work
  (setq xterm-extra-capabilities '(getSelection setSelection)))

(setq blink-cursor-mode nil ; Exactly what is sounds like
      use-short-answers t ; Set y or n instead of yes or no for questions
      display-line-numbers-type 'absolute
      frame-resize-pixelwise t) ; Better frame resizing

(setq-default tab-width 2 ; self explanitory
              indent-tabs-mode nil ; use spaces not tabs
              truncate-lines t) ;Allow truncated lines

(electric-pair-mode 0) ; No auto closing pairs like () and {}
(save-place-mode) ; Save cursor position in buffer on reopen
(global-hl-line-mode) ; Highlight the current line
(electric-indent-mode t) ; Auto Indent
(global-display-line-numbers-mode 1) ; Display line numbers

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Disables all startup warnings, and kills message buffer, comment this out when debugging
(setq warning-minimum-level :emergency)
(setq-default message-log-max nil)
(setq make-backup-files nil ; stop creating ~ files
      auto-save-default nil ; Disable autosave # files
      create-lockfiles nil  ; Disable .# files
      ;; Prevent emacs from trying to write to init.el
      custom-file (concat user-emacs-directory "trash.el"))
(setq use-dialog-box nil) ; No dialog box
(setq-default pixel-scroll-precision-mode t
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse t ;; scroll window under mouse
      mouse-wheel-tilt-scroll t
      scroll-margin 7
      scroll-preserve-screen-position t
      scroll-conservatively 101)
(setq inhibit-startup-message t) ;; Do not show the startup screen.
(setq visible-bell t)

;; Use cat as a pager. Fixes all kinds of things.
(setenv "PAGER" "cat")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(cua-mode)
(global-auto-revert-mode 1)
