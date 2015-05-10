;; add path to themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; load theme when not in terminal
(when (display-graphic-p)
  (load-theme 'sux t))

;; setup the package manager
;; TODO auto install my shiz
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; maximize the window
(toggle-frame-maximized)

;; load all the shits
(load "~/.emacs.d/tools")
(load "~/.emacs.d/keybinds")
(load "~/.emacs.d/options")

;;TODO make this better
(require 'persp-mode)
(persp-mode 1)

;; Store customizations in a file thats .gitignored
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))

