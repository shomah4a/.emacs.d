;; ストラウストラップなインデント設定 + α
(add-hook 'java-mode-hook
	  '(lambda ()
	     ;(c-toggle-hungry-state)
	     (auto-insert-mode t)
	     (define-key c-mode-map "\C-t" 'ff-find-other-file)
	     (define-key c++-mode-map "\C-t" 'ff-find-other-file)
	     (setq indent-tabs-mode nil)
	     (c-add-style "modified-stroustrup-style" modified-stroustrup-style t)
	     (c-set-style "modified-stroustrup-style")))

;; properties ファイルでは末尾空白を消さない
(add-hook 'conf-javaprop-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)
             ))
