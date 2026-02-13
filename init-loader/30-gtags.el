(setq-default gtags-global-command "/home/shoma/opt/global/global/bin/global")
(setq-default gtags-select-buffer-single t)

;; gtags-mode keys
(define-key gtags-mode-map "\C-t" 'gtags-find-tag)
;; (define-key gtags-mode-map "\C-M-t" 'gtags-find-with-grep)
(define-key gtags-mode-map "\C-r" 'gtags-find-rtag)

;; gtags-select-mode keys
;; (define-key gtags-select-mode-map "\C-m" 'gtags-select-tag)
