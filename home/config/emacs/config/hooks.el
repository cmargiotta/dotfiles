(load-config "hooks/cpp_header_guards.el")

(add-hook 'prog-mode-hook (
  lambda ()
    (display-line-numbers-mode)
    (local-set-key (kbd "C-d") #'kill-line)
    (local-set-key (kbd "C-S-c") #'kill-region)
    (local-set-key (kbd "C-S-v") #'yank)
    (local-set-key (kbd "C-z") #'undo)
    (local-set-key (kbd "C-/") #'comment-line)))

(add-hook 'emacs-startup-hook #'(lambda() ;Kills the warning buffer for even emergency messages
                                  (kill-buffer (get-buffer "*Messages*"))
                                  (kill-buffer (get-buffer "*scratch*"))))
