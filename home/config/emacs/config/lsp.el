(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-on-type-formatting t)
  (lsp-enable-suggest-server-download nil)
  (lsp-completion-provider :none)
  :hook
  ('prog-mode        . #'lsp-deferred)
  ('before-save-hook . #'lsp-format-buffer)
  :init
  :commands lsp
  :bind
  ("C-." . lsp-execute-code-action))

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

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (setq lsp-modeline-diagnostics-scope :workspace)
  (yas-global-mode))

;; Flycheck
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
