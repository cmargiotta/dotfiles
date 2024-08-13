;;; lsp.el --- LSP   -*- lexical-binding:t -*-

(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-on-type-formatting t)
  (lsp-enable-suggest-server-download nil)
  (lsp-completion-provider :none)
  (lsp-auto-guess-root t)
  (lsp-before-save-edits t)
  (lsp-idle-delay 1.0)
  (lsp-inlay-hint-enable t)
  (lsp-restart 'auto-restart)

  :init
  (defun lsp-format-buffer-on-idle ()
    (run-with-idle-timer 1.0 t (lambda ()
				 (when (and lsp-mode (buffer-modified-p))
                                   (lsp-format-buffer)))))

  (defun my-lsp-mode-setup ()
    (message "lsp-mode-hook triggered")
    (lsp-format-buffer-on-idle)
    (add-hook 'before-save-hook #'lsp-format-buffer nil t))

  (add-hook 'lsp-configure-hook #'my-lsp-mode-setup)

  :hook
  ((c++-mode   . lsp-deferred)
   (c-mode     . lsp-deferred)
   (elisp-mode . lsp-deferred))

  :commands (lsp lsp-deferred)
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
  :hook
  (treemacs-mode . #'lsp-treemacs-sync-mode))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (setq lsp-modeline-diagnostics-scope :workspace))

;; Flycheck
(use-package flycheck
  :hook
  prog-mode
  :config
  (global-flycheck-mode +1))

(use-package sideline-flycheck
  :after (flycheck)
  ;; :hook
  ;; ((flycheck-mode . #'sideline-mode)
  ;;  (flycheck-mode . #'sideline-flycheck-setup))
  :custom
  (sideline-backends-right '(sideline-flycheck)))

(use-package flycheck-rust
  :after (flycheck)
  :hook
  (flycheck-mode . flycheck-rust-setup))

(use-package flycheck-projectile
  :after (flycheck))

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . (lambda ()
		     (add-hook 'cpp-mode-hook #'flycheck-clang-tidy-setup))))
