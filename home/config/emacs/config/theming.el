;; Load nerd icons
(use-package nerd-icons
  :config
  (setq nerd-icons-font-family "RobotoMono Nerd Font"))

;; Highlight TODO comments
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
    (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF"))))

;; Display colored color strings
(use-package colorful-mode
  :hook (prog-mode text-mode))

;; Beacon
(use-package beacon
  :demand
  :config
  (beacon-mode 1)
  (add-hook 'beacon-blink 'focus-in-hook t))

;; Whitespace
(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

(use-package nyan-mode
  :init
  (setq nyan-wavy-trail t)
  (setq nyan-bar-length 10)
  (setq nyan-animate-nyancat t)
  (nyan-mode 1))

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
