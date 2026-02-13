;; auto-insert-mode 時に確認しない
(setq auto-insert-query nil)

;; .h ファイルは c++-mode
(setq auto-mode-alist
      (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

;; 基本タブ幅 4
(setq c-basic-offset 4)

;; ストラウストラップなインデント
(add-hook 'c-mode-common-hook
  '(lambda () (c-set-style "stroustrup")))

;; ストラウストラップなインデントをより VC っぽく
(defconst modified-stroustrup-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset . 0)
    (c-offsets-alist
     (statement-block-intro . +)
     (substatement-open . 0)
     (block-open . 0)
     (inline-open . 0)
     (label . 0)
     (statement-cont . +))))


;; ストラウストラップなインデント設定 + α
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     ;(c-toggle-hungry-state)
             (gtags-mode 1)
             (gtags-make-complete-list)
	     (auto-insert-mode t)
	     (define-key c-mode-map "\C-t" 'ff-find-other-file)
	     (define-key c++-mode-map "\C-t" 'ff-find-other-file)
	     (setq indent-tabs-mode nil)
	     (c-add-style "modified-stroustrup-style" modified-stroustrup-style t)
	     (c-set-style "modified-stroustrup-style")))


;; ストラウストラップなインデント設定 + α
(add-hook 'c++-mode-hook
	  '(lambda ()
	     ;(c-toggle-hungry-state)
	     (auto-insert-mode t)
	     (define-key c-mode-map "\C-t" 'ff-find-other-file)
	     (define-key c++-mode-map "\C-t" 'ff-find-other-file)
	     (setq indent-tabs-mode nil)
	     (c-add-style "modified-stroustrup-style" modified-stroustrup-style t)
	     (c-set-style "modified-stroustrup-style")))
