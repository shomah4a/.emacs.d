
;;; Frame parameters
(setq default-frame-alist
      (append '(
                ; (font . "-*-IPAMonaGothic-normal-normal-normal-*-14-*-*-*-d-0-iso10646-1")
                (font . "VLGothic-10.5")
;;		(foreground-color . "light gray")
		(background-color . "gray10")
;;		(border-color . "white")
;;		(mouse-color . "blacs")
;;		(cursor-color . "white")
		(scroll-bar-width . 14)
		(width . 160)
		(height . 65)
		(left . 10)
		(top . 0)
		(vertical-scroll-bars . right)
		(line-spacing . 0)
		(cursor-type . box))
	      default-frame-alist))
(setq initial-frame-alist default-frame-alist)

;; 行表示
(line-number-mode t)

;; 絡む表示
(column-number-mode t)

;; menu-bar いらない
(menu-bar-mode -1)

;; tool-bar いらない
(tool-bar-mode -1)

;; emacs-client
(server-start)

;; インデントは空白で
(setq-default indent-tabs-mode nil)

;; ロードパス追加
(setq site-lisp-root (substitute-in-file-name "$HOME/.emacs.d/site-lisp"))

(mapcar (lambda (p)
          (if (not (or (eq "." p) (eq ".." p)))
              (add-to-list 'load-path (concat site-lisp-root "/" p))
            )) (directory-files site-lisp-root))

;; ファイル名の補完で大文字小文字無視
(setq completion-ignore-case t)

;; 同名バッファの識別方法変更
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'browse-kill-ring)
(global-set-key "\M-y" 'browse-kill-ring)


;; 選択範囲を削除
(delete-selection-mode)

;; スクロール設定
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

(setq comint-scroll-show-maximun-output t)


;; auto-revert-tail-mode
(setq auto-mode-alist
      (cons '("\\.log$" . auto-revert-tail-mode) auto-mode-alist))

(add-hook 'auto-revert-tail-mode-hook
          '(lambda ()
             (setq auto-revert-verbose nil)))

(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

