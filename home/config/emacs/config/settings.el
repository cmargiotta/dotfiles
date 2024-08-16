;; Enable mouse in term-mode
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  ;; let terminal emacs use system clipboard
  ;; check out the xclip package if this doesn't work
  (setq xterm-extra-capabilities '(getSelection setSelection)))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
;; mode.  Vertico commands are hidden in normal buffers. This setting is
;; useful beyond Vertico.
(setq read-extended-command-predicate #'command-completion-default-include-p)

(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Add prompt indicator to `completing-read-multiple'.
;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
(defun crm-indicator (args)
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                 crm-separator)
                (car args))
        (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

(setq make-backup-files nil       ; stop creating ~ files
      auto-save-default nil       ; Disable autosave # files
      create-lockfiles nil        ; Disable .# files

      frame-resize-pixelwise t ; Better frame resizing
      use-dialog-box nil

      inhibit-startup-screen 't
      inhibit-startup-message 't

      use-short-answers 't ; Set y or n instead of yes or no for questions
      enable-recursive-minibuffers t

      message-log-max nil
      warning-minimum-level :error
      comint-prompt-read-only t

      ;; Prevent emacs from trying to write to init.el
      custom-file (concat user-emacs-directory "trash.el"))

;;; Minibuffer
;; Allow nested minibuffers
(setq enable-recursive-minibuffers t)

;; Keep the cursor out of the read-only portions of the.minibuffer
(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face
                  minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)


;;; Files
;; Disable the warning "X and Y are the same file". Ignoring this warning is
;; acceptable since it will redirect you to the existing buffer regardless.
(setq find-file-suppress-same-file-warnings t)

;; Resolve symlinks when opening files, so that any operations are conducted
;; from the file's true directory (like `find-file').
(setq find-file-visit-truename t
      vc-follow-symlinks t)

;; Skip confirmation prompts when creating a new file or buffer
(setq confirm-nonexistent-file-or-buffer nil)
(setq uniquify-buffer-name-style 'forward)
(setq mouse-yank-at-point t)

;; The native border "uses" a pixel of the fringe on the rightmost
;; splits, whereas `window-divider` does not.
(setq window-divider-default-bottom-width 1
      window-divider-default-places t
      window-divider-default-right-width 1)

;;; Auto revert
;; Auto-revert in Emacs is a feature that automatically updates the
;; contents of a buffer to reflect changes made to the underlying file
;; on disk.
(setq revert-without-query (list ".")  ; Do not prompt
      auto-revert-stop-on-user-input nil
      auto-revert-verbose t)

;; Use cat as a pager. Fixes all kinds of things.
(setenv "PAGER" "cat")

;; We often split terminals and editor windows or place them side-by-side,
;; making use of the additional horizontal space.
(setq-default fill-column 80)

;; Disable the obsolete practice of end-of-line spacing from the
;; typewriter era.
(setq sentence-end-double-space nil)

;; Continue wrapped lines at whitespace rather than breaking in the
;; middle of a word.
(setq-default word-wrap t)

(tool-bar-mode -1)
(global-auto-revert-mode 1)
