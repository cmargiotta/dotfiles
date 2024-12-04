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
(setq whitespace-line-column 140) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail))

(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  (global-ligature-mode t))

(set-face-attribute 'default nil :family "Fira Code" :height 150 :weight 'normal)

(use-package solo-jazz-theme
  :ensure t
  :config
  (load-theme 'solo-jazz t))

(use-package all-the-icons)

(use-package all-the-icons-nerd-fonts
  :straight
  (all-the-icons-nerd-fonts :host github :repo "mohkale/all-the-icons-nerd-fonts")
  :after all-the-icons
  :config
  (all-the-icons-nerd-fonts-prefer))

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
