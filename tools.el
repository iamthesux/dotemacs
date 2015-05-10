;; formats the entire buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


(defun duplicate-line()
  "copies the current lines and pastes it underneath"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)


;; kills all buffers
(defun kill-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
	  (buffer-list))
  (delete-other-windows))

;; makes the Messages buffer behave like tail
;; http://stackoverflow.com/a/4685005
(defadvice message (after message-tail activate)
  "goto point max after a message"
  (with-current-buffer "*Messages*"
    (goto-char (point-max))
    (walk-windows (lambda (window)
                    (if (string-equal (buffer-name (window-buffer window)) "*Messages*")
                        (set-window-point window (point-max))))
                  nil
                  t)))
