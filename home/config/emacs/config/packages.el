(use-package envrc
  :hook
  ('after-init . #'envrc-global-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

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

(use-package dim
  :config
  (dim-major-names
   '((yas-global-mode    ""    yas)))
  (dim-minor-names
   '((yas-minor-mode     ""    yas)
     (company-mode       ""    company)
     (eldoc-mode         ""    eldoc)
     (whitespace-mode    ""    whitespace)
     (paredit-mode       " ()" paredit)
     (my-keys-minor-mode "")
     (sideline-mode      ""     sideline)
     (beacon-mode        ""     beacon))))

(use-package projectile
  :bind ("C-S-p" . 'projectile-command-map)
  :custom
  (projectile-mode-line-function (lambda () (format " 📂[%s]" (projectile-project-name))))
  :config
  (projectile-mode))

(use-package helm
  :bind
    ("M-x" . #'helm-M-x))

(use-package helm-projectile
  :after (helm projectile)
  :config
    (helm-projectile-on))

(use-package helm-xref
  :after (helm xref))

(use-package multiple-cursors
  :bind
      ("C-S-e" .      mc/edit-lines)
      ("C-S-<down>" . mc/mark-next-like-this)
      ("C-S-<up>" .   mc/mark-previous-like-this)
      ("C-S-n" .      mc/mark-next-symbol-like-this)
      ;("C-S-p" .      mc/mark-prev-symbol-like-this)
      ("C-S-a" .      mc/mark-all-like-this))
