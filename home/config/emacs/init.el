;; Config directory
(defconst config-dir (expand-file-name "config" user-emacs-directory) t)

(defun load-config (file)
  (interactive "f")
  (load-file (expand-file-name file config-dir)))

(load-config "bindings.el")
(load-config "dashboard.el")
(load-config "hooks.el")
(load-config "lsp.el")
(load-config "packages.el")
(load-config "settings.el")
(load-config "theming.el")
(load-config "treemacs.el")
