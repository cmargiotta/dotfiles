(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :custom
  (markdown-command "multimarkdown"))

;;; Select progressively wider sections of code
(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :bind
      ("C-S-e" .      mc/edit-lines)
      ("C-S-<down>" . mc/mark-next-like-this)
      ("C-S-<up>" .   mc/mark-previous-like-this)
      ("C-S-n" .      mc/mark-next-symbol-like-this)
      ;("C-S-p" .      mc/mark-prev-symbol-like-this)
      ("C-S-a" .      mc/mark-all-like-this))

(setq
 ;; Scroll settings
 scroll-preserve-screen-position 't
 pixel-scroll-precision-mode t
 mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
 mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
 mouse-wheel-follow-mouse t ;; scroll window under mouse
 mouse-wheel-tilt-scroll t
 scroll-margin 7
 scroll-conservatively 101
 fast-but-imprecise-scrolling t
 hscroll-margin 2
 hscroll-step 1
 ;; Emacs spends excessive time recentering the screen when the cursor
 ;; moves more than N lines past the window edges (where N is the value of
 ;; `scroll-conservatively`). This can be particularly slow in larger files
 ;; during extensive scrolling. If `scroll-conservatively` is set above
 ;; 100, the window is never automatically recentered. The default value of
 ;; 0 triggers recentering too aggressively. Setting it to 10 reduces
 ;; excessive recentering and only recenters the window when scrolling
 ;; significantly off-screen.
 scroll-conservatively 10
 scroll-margin 0

 ;; Minimize cursor lag slightly by preventing automatic adjustment of
 ;; `window-vscroll' for tall lines.
 auto-window-vscroll nil
 ;; Mouse
 mouse-wheel-scroll-amount '(2 ((shift) . hscroll))
 mouse-wheel-scroll-amount-horizontal 2

 tab-width 4
 indent-tabs-mode nil ; use spaces not tabs
 truncate-lines t     ; Allow truncated lines
 blink-cursor-mode nil
 display-line-numbers-type 'absolute
 display-line-numbers-width 3
 display-line-numbers-widen t
 whitespace-line-column nil)

(cua-mode)
(global-hl-line-mode) ; Highlight the current line
(electric-pair-mode nil) ; No auto closing pairs like () and {}
(electric-indent-mode 't) ; Auto Indent
(scroll-bar-mode -1)
