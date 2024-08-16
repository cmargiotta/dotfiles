(use-package magit
  :bind ("C-x g" . #'magit-status)
  :custom
  (magit-module-sections-nested t)
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
