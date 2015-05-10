(global-set-key (kbd "C-c C-d") 'duplicate-line)
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(global-set-key (kbd "C-c e") 'eval-region)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-c C-r") 'replace-regexp)
(global-set-key (kbd "C-c g") 'magit-status)

;; TODO get this to work
;; (define-key persp-key-map (kbd "C-x x") 'persp-keymap-prefix)

(with-eval-after-load "help-mode"
  (define-key help-mode-map (kbd "<mouse-5>") 'help-go-forward)
  (define-key help-mode-map (kbd "<mouse-4>") 'help-go-back))
