(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-a") #'mark-whole-buffer)
    (define-key map (kbd "C-s") #'save-buffer)
    (define-key map (kbd "C-z") #'undo)
    (define-key map (kbd "C-S-z") #'undo-redo)
    (define-key map (kbd "C-k") #'kill-current-buffer)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)
