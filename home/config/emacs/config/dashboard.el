(defun dashboard/random-quote ()
  "Generate a random quote for dashboard"
  (interactive)
  (let ((ops '(
    "Did you uninstall vscode?"
    "Whopper Whopper Whopper Whopper Junior Double Triple Whopper"
    "Pepe"
    "Chomsky"
    "Stink Boys Inc©"
    "No emacs???")))(nth (random (length ops)) ops)))

(defun dashboard/random-ascii ()
  (interactive)
  (let ((ops '(
"
    ⠀⠀⠀⠀⠀⡰⢂⣾⠿⠛⠒⠚⠛⠃⠺⢶⡀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⢠⡣⠋⠁⠀⠀⠀⠀⠀⢀⡐⠒⢙⣄⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⢄⠉⠀⠐⠀⠀⠙⢦⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⣾⠁⠀⠀⠄⠂⢈⣠⠎⠀⠀⣸⣿⡿⠓⢬⡇⠀⠀⠀⠀⠀
    ⠀⠀⢸⡟⠀⠔⣁⣤⣶⣿⠋⢰⠀⠀⣿⡟⠻⣦⠀⢳⠀⠀⠀⠀⠀
    ⠀⠀⣷⡇⢠⣾⢟⢭⣭⡭⡄⠀⡆⠀⣿⣷⣶⠺⡆⢸⡄⠀⠀⠀⠀
    ⠀⠀⠇⡇⠛⠡⣑⣈⣛⠝⢁⡀⠇⠀⣿⡿⠛⠒⣡⠇⣧⣀⠀⠀⠀
    ⠀⠀⢠⠁⠈⠐⠤⠄⠀⣠⢸⠈⠢⠀⣿⡇⠀⠀⠠⠚⣿⣿⠀⠀⠀
    ⡄⠀⢾⠀⡆⠠⣴⠞⠯⡀⠈⠙⠲⣶⣿⡇⠑⣦⡄⠀⣿⣿⠀⠀⠀
    ⠈⠺⡮⠀⢡⠀⠀⠀⠀⠀⠁⠐⠒⠒⠛⠃⠈⠛⠇⠀⡏⡏⠀⠀⠀
    ⠀⢰⠁⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⢷⠀⠀⠀
    ⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⢸⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀
    ⠀⠀⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠸⡳⡀⠀
    ⠀⠀⠀⠑⢄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣯⣼⡇⠑⣄
"
"
⠀⢀⠔⠂⠉⠉⠉⠉⠑⠢⡄⣀⠔⠊⠁⠀⠒⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡰⠁⠀⠀⠀⠀⢀⣀⣀⣀⠘⡇⠀⠀⠀⠀⠀⠀⠘⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠁⠀⠀⣠⠔⠉⠁⠀⠀⠀⠉⠉⠲⣤⠖⠒⠒⠒⠲⠬⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠔⣊⠭⠭⠭⠭⢭⣛⠩⣉⠲⣇⠀⠀⢀⣶⠶⢦⣶⢷⣤⡀⠀⠀⠀⠀
⠀⠀⢸⣵⣉⡤⠤⢤⣤⣤⣤⣬⠵⠮⣶⣌⣇⠐⣫⣶⣭⣭⣍⡑⢼⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠈⣅⠲⣿⣞⣿⣉⣿⠀⠀⠘⡎⣇⡜⣿⣾⣿⣹⡇⠈⣽⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠓⠤⢈⣉⣛⣓⣂⣒⣊⡽⠂⢹⣛⠛⢛⠛⣒⣩⠞⠀⠀⠀⠀⠀
⠀⠠⠤⠂⠀⠀⠀⠀⠀⠀⠀⠀⣀⠼⠁⠀⠀⠀⠈⠫⡁⠐⠛⠁⠱⡀⠀⠀⠀⠀
⢠⢶⠭⠭⣄⣀⠀⠀⠀⠤⠒⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢰⢻⠄⠀⠀⠀
⠀⠘⢦⣙⠲⠤⣍⡉⠑⠒⠢⠤⠤⠤⣀⣀⣀⣀⣀⣀⣀⣀⣀⠔⣡⠊⠀⠀⠀⠀
⠀⠀⠀⠈⠉⠢⢄⡈⠉⠁⠀⠀⠒⠒⠦⠤⠤⠤⠤⠤⠤⠤⠤⠊⡸⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠙⠒⠂⠤⠤⠤⠤⢄⣀⣀⡤⠤⠤⢤⠤⠚⠅⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠒⠓⢤⠞⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢄⡠⢶⡁⠀⣀⣀⡀⢑⠢⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⠀⠣⢶⠕⢋⢔⡵⠗⠁⠀⠈⠳⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⠀⠘⣖⡝⠁⠀⢀⠔⠀⠀⠀⠘⣆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠈⠑⠤⢠⠃⠀⣠⠞⢀⠄⠈⢆
"
    ))) (nth (random (length ops)) ops)))

(use-package dashboard
  :ensure t
  :custom
    (default-directory "~/")
    (dashboard-icon-type 'all-the-icons)
    (dashboard-set-file-icons t)
    (dashboard-vertically-center-content t)
    (dashboard-center-content t)
    (dashboard-display-icons-p t)
    (dashboard-projects-switch-function #'projectile-switch-project-by-name)
    (dashboard-banner-logo-title (dashboard/random-quote))
    (dashboard-footer-messages `(,(dashboard/random-quote)))
    (dashboard-startup-banner 'ascii)
    (dashboard-banner-ascii (dashboard/random-ascii))
    (dashboard-items '((bookmarks . 3)
		       (projects  . 3)
                       (recents   . 2)))
  :config
    (dashboard-setup-startup-hook))
