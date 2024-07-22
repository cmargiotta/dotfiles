;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)

;; Packages
(use-package envrc
  :hook
  ('after-init . #'envrc-global-mode))

(use-package company
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (global-company-mode t)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package magit
  :bind ("C-x g" . #'magit-status)
  :custom
  (magit-module-sections-nested t)
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                            'magit-insert-modules
                            'magit-insert-unpulled-from-upstream))

(use-package nix-mode
  :mode "\\.nix\\'"
  :hook
  ('before-save-hook #'nix-format-buffer))

(use-package elisp-autofmt
  :custom
  (elisp-autofmt-on-save-p t)
  :hook
  ('elisp-mode-hook #'elisp-autofmt-mode))

(use-package xref)

(use-package dap-mode
  :custom
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)
  :config
  (setq left-fringe-width 16)
  :hook
  (lsp-mode . dap-auto-configure-mode)
  (c++-mode . (lambda ()
		(require 'dap-gdb-lldb))))

;; connect with @<username>:host.org
(use-package ement
  :hook (ement-room-mode . (lambda () (display-line-numbers-mode -1)))
  :general
    (leader 
      "m m" '((lambda () (interactive) (persp-switch "matrix") (ement-connect)) :wk "Matrix with ement"))
    (:keymaps 'ement-room-minibuffer-map :states 'insert "RET" #'newline)
  :config
  (setq ement-notify-dbus-p nil))

(defun jl/random-quote ()
  "Generate a random quote for dashboard"
  (interactive)
  (let ((ops '(
    "Hello World!"
    "Whopper Whopper Whopper Whopper Junior Double Triple Whopper"
    "sudo systemctl stop justinlime"
    "sudo systemctl start justinlime"
    "sudo systemctl restart justinlime"
    "White Monster"
    "https://stinkboys.com"
    "Stink Boys Inc. ©"
    "/home/justinlime/.config"
    "No emacs???"))) (nth (random (length ops)) ops)))

(defun jl/random-ascii ()
  "Generate a random quote for dashboard"
  (interactive)
  (let ((ops '(
"
    ⠀⠀⠀⠀⠀⡰⢂⣾⠿⠛⠒⠚⠛⠃⠺⢶⡀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⢠⡣⠋⠁⠀⠀⠀⠀⠀⢀⡐⠒⢙⣄⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⢄⠉⠀⠐⠀⠀⠙⢦⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⣾⠁⠀⠀⠄⠂⢈⣠⠎⠀⠀⣸⣿⡿⠓⢬⡇⠀⠀⠀⠀⠀
    ⠀⠀⢸⡟⠀⠔⣁⣤⣶⣿⠋⢰⠀⠀⣿⡟⠻⣦⠀⢳⠀⠀⠀⠀⠀
    ⠀⠀⣷⡇⢠⣾⢟⢭⣭⡭⡄⠀⡆⠀⣿⣷⣶⠺⡆⢸⡄⠀⠀⠀⠀
    ⠀⠀⠇⡇⠛⠡⣑⣈⣛⠝⢁⡀⠇⠀⣿⡿⠛⠒⣡⠇⣧⣀⠀⠀⠀
    ⠀⠀⢠⠁⠈⠐⠤⠄⠀⣠⢸⠈⠢⠀⣿⡇⠀⠀⠠⠚⣿⣿⠀⠀⠀
    ⡄⠀⢾⠀⡆⠠⣴⠞⠯⡀⠈⠙⠲⣶⣿⡇⠑⣦⡄⠀⣿⣿⠀⠀⠀
    ⠈⠺⡮⠀⢡⠀⠀⠀⠀⠀⠁⠐⠒⠒⠛⠃⠈⠛⠇⠀⡏⡏⠀⠀⠀
    ⠀⢰⠁⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⢷⠀⠀⠀
    ⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⢸⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀
    ⠀⠀⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠸⡳⡀⠀
    ⠀⠀⠀⠑⢄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣯⣼⡇⠑⣄
"
"
⠀⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝
⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇
⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀
⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁⠀⠀⠀
⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂⠀⠀⠀⠀
⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"
"
⠀⠀⠀⠀⠀⠀⢀⣤⣤⡴⢾⠾⠛⠾⠛⠶⠟⠷⡿⠶⡶⢶⣄⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣶⠟⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⣦⡀⠀⠀⠀⠀
⠀⠀⢀⣴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣆⠀⠀⠀
⠀⠀⣼⠋⠀⠀⢀⣀⣠⡄⠤⣀⣤⣠⣀⣠⣠⢆⢤⡠⣄⣠⠀⠀⠀⠀⢻⡆⠀⠀
⠀⢰⡏⠀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⡀⠀⠀⢿⠀⠀
⠀⢸⡇⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⢸⡀⠀
⠀⢸⡇⢸⠀⠀⠀⠀⠀⠀⠀⠐⠉⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠘⡄⢸⡇⠀
⠀⢸⡇⢸⠀⠀⠀⠀⠀⠀⢀⠤⠐⠊⠉⠉⠒⠂⠤⠀⠀⠀⠀⠀⠀⠀⡇⢸⡇⠀
⠀⢸⡇⢸⢠⣤⣤⣤⣤⣤⣤⣤⣤⡀⠀⠀⢠⡴⠶⠶⠶⠶⠶⠶⢶⡄⡇⢸⡇⠀
⠀⣸⠇⣸⣾⠃⠀⢀⣀⣒⣰⠀⠸⣷⠾⠷⣾⡇⠀⣮⠕⢒⣄⠀⠘⡟⣷⣸⣧⡀
⣼⢛⣾⡻⢸⠀⢠⠁⢴⡆⠈⡆⠀⡇⠀⠀⢸⡆⠸⡁⠰⡆⠀⣧⢰⡇⠷⢻⠊⣿
⢿⠀⢳⠀⠸⣇⠀⠉⠒⠒⠉⠀⣸⠇⠀⠀⠸⣇⠀⠈⠑⠒⠉⠁⣸⠇⠀⡇⠀⡿
⠸⣇⠘⢰⠀⠈⠛⠓⠒⠒⠒⠛⠉⠀⠀⠀⠀⡉⠛⠛⠛⠛⠛⠋⠁⠀⢣⠁⢸⠇
⠀⢻⣆⡇⠀⠀⠀⠀⠀⠀⠀⣠⠊⠀⠀⠀⠀⠘⢆⠀⠀⠀⠀⠀⠀⠀⢸⣤⡟⠀
⠀⠀⠸⣷⠀⠀⠀⠀⠀⢀⠐⢇⠚⠳⢄⣠⠔⠉⠡⠇⢄⠀⠀⠀⠀⡀⢸⡇⠀⠀
⠀⠀⠀⣿⠀⠈⠒⠒⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠐⠂⠉⠀⣾⠃⠀⠀
⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⡀⠀⢀⣀⣀⣀⣀⣀⣀⡀⡀⠀⠀⠀⠀⠀⣿⠀⠀⠀
⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠈⠉⠠⣀⣀⣀⣀⡠⠄⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀
⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀
⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀
⠀⠀⠀⠀⠘⣗⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠐⣿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠈⠑⠒⠤⠤⠤⠤⠤⠐⠊⠁⠀⠀⠀⢠⡏⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⡷⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠛⠶⠶⢤⣤⣤⣤⣤⣤⣤⣤⣤⠤⠶⠶⠛⠋⠁⠀⠀⠀⠀⠀
"
    ))) (nth (random (length ops)) ops)))
(defun jl/random-icon ()
  "Generate a random image for dashboard"
  (interactive)
  (let* ((icons-dir (expand-file-name "icons/" user-emacs-directory))
        (ops (directory-files icons-dir))
        (ops (delete "." ops))
        (ops (delete ".." ops))
        (file (nth (random (length ops)) ops)))
          (expand-file-name file icons-dir)))

(use-package dashboard
  :ensure t
  :custom
    (default-directory "~/")
    (dashboard-icon-type 'nerd-icons)
    (dashboard-set-file-icons t)
    (dashboard-vertically-center-content t)
    (dashboard-center-content t)
    (dashboard-display-icons-p t)
    (dashboard-projects-switch-function 'projectile-persp-switch-project)
    (initial-buffer-choice (lambda() (get-buffer-create "*dashboard*")) )
    (dashboard-banner-logo-title (jl/random-quote))
    (dashboard-footer-messages `(,(jl/random-quote)))
    (dashboard-startup-banner 'ascii)
    (dashboard-banner-ascii (jl/random-ascii))
  :config
    (dashboard-setup-startup-hook))

(use-package perspective
  :init
    (setq persp-suppress-no-prefix-key-warning t)
    (setq persp-initial-frame-name "emacs")
    (setq persp-mode-prefix-key "C-p")
    (persp-mode))

(use-package nerd-icons
  :config
  (setq nerd-icons-font-family "RobotoMono Nerd Font"))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
    (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF"))))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

;;;; Treemacs family
(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-F") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
    (treemacs-add-and-display-current-project-exclusively)
    (treemacs-project-follow-mode)
  :bind
  (:map global-map
        ("M-F"       . #'treemacs-select-window)
        ("C-x t 1"   . #'treemacs-delete-other-windows)
        ("C-x t t"   . #'treemacs)
        ("C-x t d"   . #'treemacs-select-directory)
        ("C-x t B"   . #'treemacs-bookmark)
        ("C-x t C-t" . #'treemacs-find-file)
        ("C-x t M-t" . #'treemacs-find-tag)))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-magit
  :after (treemacs magit))

;;;; LSP
(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-on-type-formatting t)
  (lsp-enable-suggest-server-download nil)
  :hook
  ('prog-mode . #'lsp-deferred)
  :commands lsp
  :bind
  ("C-." . lsp-execute-code-action))

(add-hook 'before-save-hook #'lsp-format-buffer)
(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))


(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-delay 1)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-toggle-symbols-info t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-peek-enable t))

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :config
  (lsp-treemacs-sync-mode 1))

;;;; Projectile
(use-package projectile
  :bind ("C-S-p" . 'projectile-command-map)
  :config
    ;(setq projectile-project-search-path '(("~/projects/" . 4)))
    ;(projectile-discover-projects-in-search-path)
    (projectile-global-mode))

;;;; Helm
(use-package helm
  :bind
    ("M-x" . #'helm-M-x)
    ("C-x r b" . #'helm-filtered-bookmarks)
    ("C-x C-f" . #'helm-find-files))

(use-package helm-projectile
  :after (helm projectile)
  :config
    (helm-projectile-on))

(use-package helm-xref
  :after (helm xref))

;;;; Flycheck
(use-package flycheck
  :hook
  ('after-init-hook global-flycheck-mode)
  :config
  (global-flycheck-mode +1))

(use-package sideline-flycheck
  :after (flycheck)
  :hook
  ('flycheck-mode . sideline-mode)
  ('flycheck-mode . sideline-flycheck-setup)
  :custom
  (sideline-backends-right '(sideline-flycheck)))

(use-package flycheck-rust
  :after (flycheck)
  :hook
  ('flycheck-mode . flycheck-rust-setup))

(use-package flycheck-projectile
  :after (flycheck))

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  ('flycheck-mode . flycheck-clang-tidy-setup))

;; Enable mouse in term-mode
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  ;; let terminal emacs use system clipboard
  ;; check out the xclip package if this doesn't work
  (setq xterm-extra-capabilities '(getSelection setSelection)))
(setq blink-cursor-mode nil ; Exactly what is sounds like
      use-short-answers t ; Set y or n instead of yes or no for questions
      display-line-numbers-type 'relative ; Realive line numbers
      frame-resize-pixelwise t) ; Better frame resizing
(setq-default tab-width 2 ; self explanitory
              indent-tabs-mode nil ; use spaces not tabs
              truncate-lines t) ;Allow truncated lines
(electric-pair-mode 1) ; Auto closing pairs like () and {}
(save-place-mode) ; Save cursor position in buffer on reopen
(global-hl-line-mode) ; Highlight the current line
(electric-indent-mode t) ; Auto Indent
(global-display-line-numbers-mode 1) ; Display line numbers
(global-prettify-symbols-mode) ; prettyyyyyyy

;; Whitespace
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style (quote
( spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-display-mappings
      '(
 	(space-mark   ?\     [? ]) ;;;use space not dotimes
 	(space-mark   ?\xA0  [?\u00A4]     [?_])
 	(space-mark   ?\x8A0 [?\x8A4]      [?_])
 	(space-mark   ?\x920 [?\x924]      [?_])
 	(space-mark   ?\xE20 [?\xE24]      [?_])
 	(space-mark   ?\xF20 [?\xF24]      [?_])
 	;;(newline-mark ?\n    [? ?\n])
 	(tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])
	;(tab-mark 9 [9655 9] [92 9]) ; tab
	))


;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(set-frame-font "Fira Code 14" nil t)
(load-theme 'kanagawa t)

(add-hook 'prog-mode-hook (
  lambda ()
    (display-line-numbers-mode)
    (local-set-key (kbd "C-d") #'kill-line)
    (local-set-key (kbd "C-S-c") #'kill-region)
    (local-set-key (kbd "C-S-v") #'yank)
    (local-set-key (kbd "C-z") #'undo)
    (local-set-key (kbd "C-/") #'comment-line)))

;; Kill *Help* after :q'ing
(advice-add #'evil-quit :after #'(lambda (&rest r)
  (let ((buf (get-buffer "*Help*")))
    (if (eq buf nil) nil
      (kill-buffer buf)))))

;; Disables all startup warnings, and kills message buffer, comment this out when debugging
(setq warning-minimum-level :emergency)
(setq-default message-log-max nil)

(add-hook 'emacs-startup-hook #'(lambda() ;Kills the warning buffer for even emergency messages
				                          (kill-buffer (get-buffer "*Messages*"))
                                  (kill-buffer (get-buffer "*scratch*"))))

(setq make-backup-files nil ; stop creating ~ files
      auto-save-default nil ; Disable autosave # files
      create-lockfiles nil  ; Disable .# files
      ;; Prevent emacs from trying to write to init.el
      custom-file (concat user-emacs-directory "trash.el"))

(setq use-dialog-box nil) ; No dialog box
(scroll-bar-mode -1) ;Disable scroll bar

(setq-default pixel-scroll-precision-mode t
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse t ;; scroll window under mouse
      mouse-wheel-tilt-scroll t
      scroll-margin 7
      scroll-preserve-screen-position t
      scroll-conservatively 101)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (setq lsp-modeline-diagnostics-scope :workspace)
  (yas-global-mode))

(cua-mode)

(global-auto-revert-mode 1)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-f") #'re-search-forward)
    (define-key map (kbd "C-j") #'term)
    (define-key map (kbd "C-a") #'mark-whole-buffer)
    (define-key map (kbd "C-s") #'save-buffer)
    (define-key map (kbd "C-k") #'kill-current-buffer)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)
