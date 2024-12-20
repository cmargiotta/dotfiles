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

      use-short-answers 't ; Set y or n instead of yes or no for questions
      enable-recursive-minibuffers t

      message-log-max nil
      warning-minimum-level :error
      comint-prompt-read-only t

      ;; Prevent emacs from trying to write to init.el
      custom-file (concat user-emacs-directory "trash.el"))

(load custom-file)


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
