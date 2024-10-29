(use-package envrc
  :config (envrc-global-mode 1))

(use-package yasnippet
  :config
  (yas-global-mode 1))

;; (use-package nix-mode
;;   :mode "\\.nix\\'"
;;   :hook
;;   (before-save . #'nix-format-buffer))

(use-package elisp-autofmt
  :custom
  (elisp-autofmt-on-save-p t)
  :hook
  elisp-mode)

(use-package xref)

(use-package dap-mode
  :after lsp-mode
  :custom
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)
  (left-fringe-width 16)
  :hook
  ((lsp-mode . dap-auto-configure-mode)
   (c++-mode  . (lambda ()
                  (require 'dap-gdb-lldb)))))

(use-package projectile
  :bind
 ("C-S-p" . #'projectile-command-map)
 ("C-j" . #'projectile-run-vterm)
 ("C-S-h" . #'project-query-replace-regexp)
 :custom
 (projectile-switch-project-action
  #'treemacs-add-and-display-current-project-exclusively)
 :init
 ;;(setq projectile-project-root-files '(".projectile"))
 (defcustom projectile-project-root-functions
  '(projectile-root-local
    projectile-root-marked
    projectile-root-top-down-recurring
    projectile-root-top-down
    projectile-root-bottom-up)
  "A list of functions for finding project roots."
  :group 'projectile
  :type '(repeat function))
 (projectile-mode))

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

(use-package compiler-explorer)

(use-package
 vterm
 :ensure t

 :init
 (defun run-in-vterm (command)
   "Execute string COMMAND in a new vterm.

Interactively, prompt for COMMAND with the current project root.
When called from Dired, supply the name of the
file at point.

Like `async-shell-command`, but run in a vterm for full terminal features.

When the command terminates, the shell remains open, but when the
shell exits, the buffer is killed."
   (interactive "sCommand: ")
   (let ((vterm-shell "bash")
	 (vterm-kill-buffer-on-exit 't))
     (progn
       (vterm)
       (vterm-send-string (concat command "; exit") t)
       (vterm-send-return)))))
