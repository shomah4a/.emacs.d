
;; mark の push/pop
(global-set-key "\C-c\r" 'pop-to-mark-command)
(global-set-key "\C-c\p" 'push-mark-command)

;; C-z での最小化を無効
(define-key global-map "\C-z" nil)

;; C-h を Backspace に
(global-set-key "\C-h" 'backward-delete-char-untabify)

(defun no-exit ()
  (interactive)
  (message "can't exit by C-x C-c. Use M-x kill-emacs"))

;; Copy, Paste を変更
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-x\C-c" 'no-exit)

(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))

