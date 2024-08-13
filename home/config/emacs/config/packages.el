(use-package envrc
  :hook
  ('after-init . #'envrc-global-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

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

(use-package magit-lfs
  :after magit)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-modes
  :config
  (require 'gitignore-mode))

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

(use-package projectile
  :bind
  ("C-S-p" . #'projectile-command-map)
  ("C-j"   . #'project-eshell)
  :after treemacs
  :custom
  (projectile-switch-project-action #'treemacs-add-and-display-current-project-exclusively)
  :config
  (projectile-mode))

(use-package multiple-cursors
  :bind
      ("C-S-e" .      mc/edit-lines)
      ("C-S-<down>" . mc/mark-next-like-this)
      ("C-S-<up>" .   mc/mark-previous-like-this)
      ("C-S-n" .      mc/mark-next-symbol-like-this)
      ;("C-S-p" .      mc/mark-prev-symbol-like-this)
      ("C-S-a" .      mc/mark-all-like-this))

(use-package embark
  :ensure t

  :bind
  (("M-." . embark-act)
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package visual-regexp)
(use-package visual-regexp-steroids
  :bind
  ("C-h" . #'vr/replace)
  ("C-f" . #'vr/isearch-forward)
  ("C-r" . #'vr/isearch-backward))

(use-package link-hint
  :bind
  ("C-L" . link-hint-open-link))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package git-timemachine)
(use-package compiler-explorer)

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))
