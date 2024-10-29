(use-package magit
  :bind ("C-x g" . #'magit-status)
  :custom
  (magit-module-sections-nested t)
  :init
  (defun commitizen() (interactive) (progn
				      (run-in-vterm "git cz commit; exit")
				      (add-hook 'kill-buffer-hook 'magit-refresh-all nil t)))
  (with-eval-after-load 'magit
    (defalias 'magit-commit-create 'commitizen))
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                            'magit-insert-modules
                            'magit-insert-unpulled-from-upstream))

(use-package magit-lfs
  :after magit)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-modes
  :config
  (require 'gitignore-mode))

(use-package git-timemachine)
