;; Load nerd icons  -*- lexical-binding: t; -*-
(use-package nerd-icons
  :config
  (setq nerd-icons-font-family "RobotoMono Nerd Font"))

;; Highlight TODO comments
(use-package hl-todo
  :hook prog-mode
  :config
    (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF"))))

;; Display colored color strings
(use-package colorful-mode
  :hook (prog-mode . #'text-mode))

;; Beacon
(use-package beacon
  :demand
  :config
  (beacon-mode 1)
  (add-hook 'beacon-blink 'focus-in-hook t))

;; Whitespace
(use-package whitespace
  :init
  (dolist (hook '(c++-mode-hook rust-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 140) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(defun prettify-cpp ()
  (progn
    (setq prettify-symbols-alist
          '((" &&" . " ∧")
            ("||" . "∨")
            ("!" . "¬")
            ("for" . "∀")
            ("float" . "ℝ")
            ("void" . "∅")
            ("typename" . "𝓣")
            ("return" . "↩")
            ("true" . "⊤")
            ("false" . "⊥")))
    (prettify-symbols-mode 1)))

(add-hook 'c++-mode-hook #'prettify-cpp)
(add-hook 'c-mode-hook #'prettify-cpp)

(global-ligature-mode 't)
(set-face-attribute 'default nil :family "Fira Code" :height 150 :weight 'normal)

(use-package solo-jazz-theme
  :ensure t
  :config
  (load-theme 'solo-jazz t))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package centaur-tabs
  :init
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-enable-buffer-alphabetical-reordering)
  (remove-hook 'kill-buffer-hook 'centaur-tabs-buffer-track-killed)
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-style "bar")
  (centaur-tabs-set-icons t)
  (centaur-tabs-show-new-tab-button nil)
  (centaur-tabs-adjust-buffer-order t)
  (centaur-tabs-set-bar 'left)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-mode t)
  :bind
  ("M-<left>" . centaur-tabs-backward)
  ("M-<right>" . centaur-tabs-forward))

(use-package telephone-line
  :custom
  (telephone-line-primary-left-separator 'telephone-line-cubed-left)
  (telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left)
  (telephone-line-primary-right-separator 'telephone-line-cubed-right)
  (telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
  (telephone-line-height 24)
  (telephone-line-evil-use-short-tag t)
  :config
  (telephone-line-mode))
