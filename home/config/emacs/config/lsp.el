;;; lsp.el --- LSP   -*- lexical-binding:t -*-

(use-package
 lsp-mode
 :custom
 (lsp-auto-guess-root t)
 (lsp-before-save-edits t)
 (lsp-completion-provider :none)
 (lsp-completion-show-detail t)
 (lsp-completion-show-kind nil)
 (lsp-eldoc-enable-hover t)
 (lsp-enable-on-type-formatting t)
 (lsp-enable-suggest-server-download nil)
 (lsp-idle-delay 0.5)
 (lsp-inlay-hint-enable nil)
 (lsp-keymap-prefix "C-c l")
 (lsp-log-io nil)
 (lsp-restart 'auto-restart)
 (lsp-signature-auto-activate t)
 (lsp-signature-render-documentation t)

 ;; Nix
 (lsp-nix-nil-formatter ["nixfmt"])

 :init
 (defun lsp-format-buffer-on-idle ()
   (run-with-idle-timer
    10.0 t
    (lambda ()
      (when (and lsp-mode (buffer-modified-p))
        (lsp-format-buffer)))))

 (defun my-lsp-mode-setup ()
   (message "lsp-mode-hook triggered")
   ;; (lsp-format-buffer-on-idle)
   (add-hook 'before-save-hook #'lsp-format-buffer nil t))

 (add-hook 'lsp-configure-hook #'my-lsp-mode-setup)

 :hook
 (((c++-mode
    c-mode
    dockerfile-mode
    js-json-mode
    markdown-mode
    nix-mode
    shell-script-mode
    yaml-mode)
   . lsp-deferred)
  (lsp-mode-hook . cape-setup-capf))

 :commands (lsp lsp-deferred)
 :bind ("C-." . lsp-execute-code-action))

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))

(use-package
 lsp-ui
 :after lsp-mode
 :custom-face (lsp-ui-sideline-code-action ((t (:inherit warning))))
 :hook lsp-mode
 :custom

 (lsp-ui-doc-enable nil)
 (lsp-ui-sideline-enable t)
 (lsp-ui-sideline-show-code-actions t)
 (lsp-ui-sideline-show-hover t)
 (lsp-ui-sideline-delay 1)
 (lsp-ui-sideline-show-diagnostics t)
 (lsp-ui-sideline-toggle-symbols-info t)
 (lsp-ui-sideline-show-hover nil)
 (lsp-ui-peek-enable t))

(use-package
 lsp-treemacs
 :after (lsp-mode treemacs)
 :hook (treemacs-mode . #'lsp-treemacs-sync-mode))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (setq lsp-modeline-diagnostics-scope :workspace))

;; Flycheck
(use-package flycheck :hook prog-mode :config (global-flycheck-mode +1))

(use-package
 sideline-flycheck
 :after (flycheck)
 ;; :hook
 ;; ((flycheck-mode . #'sideline-mode)
 ;;  (flycheck-mode . #'sideline-flycheck-setup))
 :custom (sideline-backends-right '(sideline-flycheck)))

(use-package
 flycheck-rust
 :after (flycheck)
 :hook (flycheck-mode . flycheck-rust-setup))

(use-package flycheck-projectile :after (flycheck))

(use-package
 flycheck-clang-tidy
 :after flycheck
 :hook
 (flycheck-mode
  . (lambda () (add-hook 'cpp-mode-hook #'flycheck-clang-tidy-setup))))

(use-package
 elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :custom (elisp-autofmt-on-save-p t)
 :hook emacs-lisp-mode)

(use-package yaml-mode)
(use-package meson-mode)
(use-package dockerfile-mode)
