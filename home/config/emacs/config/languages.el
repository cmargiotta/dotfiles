;;; lsp.el --- LSP   -*- lexical-binding:t -*-

(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

(use-package rustic
  :after (rust-mode)
  :config
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))

(use-package yasnippet
  :ensure t
  :hook ((lsp-mode . yas-minor-mode)))

(use-package
 lsp-mode
 :custom
 (lsp-auto-guess-root t)
 (lsp-before-save-edits t)
 (lsp-clients-clangd-args '("-j=4" "--background-index" "--clang-tidy" "--completion-style=detailed" "-log=error"))
 (lsp-completion-provider :none)
 (lsp-completion-show-detail t)
 (lsp-completion-show-kind nil)
 (lsp-eldoc-enable-hover t)
 (lsp-enable-on-type-formatting nil)
 (lsp-enable-suggest-server-download nil)
 ;; (lsp-idle-delay 0.5)
 (lsp-inline-completion-enable t)
 (lsp-inlay-hint-enable nil)
 (lsp-keymap-prefix "C-c l")
 (lsp-log-io nil)
 (lsp-restart 'auto-restart)
 (lsp-signature-auto-activate t)
 (lsp-signature-render-documentation t)

 ;; Nix
 (lsp-nix-nil-formatter ["nixpkgs-fmt"])

 :init
 (defun my-lsp-mode-setup ()
   (lsp-diagnostics-mode)
   (lsp-modeline-diagnostics-mode)
   (lsp-inline-completion-mode)
   (add-hook 'before-save-hook #'lsp-format-buffer nil t))

 (add-hook 'lsp-configure-hook #'my-lsp-mode-setup)

 :hook
 (prog-mode . lsp-deferred)

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
 :config (lsp-treemacs-sync-mode 1))

;; Flycheck
;; (use-package flycheck
;;   :config
;;   (add-hook 'after-init-hook #'global-flycheck-mode))

;; (use-package
;;  sideline-flycheck
;;  :after (flycheck)
;;  ;; :hook
;;  ;; ((flycheck-mode . #'sideline-mode)
;;  ;;  (flycheck-mode . #'sideline-flycheck-setup))
;;  :custom (sideline-backends-right '(sideline-flycheck)))

;; (use-package
;;  flycheck-rust
;;  :after (flycheck)
;;  :hook (flycheck-mode . flycheck-rust-setup))

;; (use-package
;;   flycheck-projectile
;;   :after (flycheck))

(use-package
 elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :custom (elisp-autofmt-on-save-p t)
 :hook emacs-lisp-mode)

(use-package yaml-mode)
(use-package meson-mode)
(use-package dockerfile-mode)
(use-package nix-mode)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
