(defconst define-refexp "#define [[:alnum:]_]+")
(defconst endif-regexp "#endif /\*[[:blank:][:alnum:]_]*")

(defconst ifndef-regexp "#ifndef \\([[:alnum:]_]+\\)")

(defun current-header-guard ()
    (save-excursion
      (goto-char (point-min)) ; Move cursor to buffer start
      (if
          (re-search-forward ifndef-regexp nil t)
          (match-string-no-properties 1)
        nil)))

(defun delete-line-matching-regex (regex &optional backward)
  "Delete the first line in the buffer that matches the given REGEX."
  (let ((count 1))
    (if backward (setq count -1))
    (if (re-search-forward regex nil 0 count) (delete-line))))

(defun header-guard ()
  (upcase
   (concat
    (subst-char-in-string ?- ?_ (subst-char-in-string
                                 ?\s ?_ (projectile-project-name)))
    "_"
    (subst-char-in-string ?/ ?_
                          (string-join
                           (cdr
                            (file-name-split
                             (file-relative-name
                              (file-name-sans-extension buffer-file-name)
                              (projectile-project-root))))
                           "/"))
    "_HPP_")))

(defun delete-old-header-guard ()
  (save-excursion
    (let ((guard (current-header-guard)))
      (progn
        (goto-char (point-min))
        (delete-line-matching-regex (concat "#ifndef " guard))
        (delete-line-matching-regex (concat "#define " guard))
        (goto-char (point-max))
        (delete-line-matching-regex "#endif" 't)))))

(defun insert-guards ()
  (let ((guard (header-guard)))
    (save-excursion
      (goto-char (point-min))
      (insert (concat "#ifndef " guard "\n"
                      "#define " guard "\n"))
      (goto-char (point-max))
      (insert (concat "#endif /* " guard "*/\n")))))

(defun buffer-contains-regex? (regex)ifndef-regexp
  "Return non-nil if the current buffer contains a match for the given REGEX."
  (save-excursion ; Save cursor position
    (goto-char (point-min)) ; Move cursor to buffer start
    (re-search-forward regex nil 0)))

(defun buffer-is-hpp-file? ()
  "Return non-nil if the current buffer is visiting a file with a .hpp extension."
  (let ((file-name (buffer-file-name)))
    (and file-name
         (string= (file-name-extension file-name) "hpp"))))

(defun buffer-has-header-guards? ()
  (let (buffer-content (buffer-string))
    (buffer-contains-regex? "#ifndef [[:alnum:]_]+")))

(defun write-header-guards ()
    (if (buffer-is-hpp-file?)
        ((lambda ()
          (if (buffer-has-header-guards?)
              (delete-old-header-guard))
          (insert-guards)
          (lsp-format-buffer)))))

(add-hook 'before-save-hook #'write-header-guards)
