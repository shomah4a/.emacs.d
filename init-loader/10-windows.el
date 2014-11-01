;;
;; windows を導入
;;
(setq win:switch-prefix "\C-z\C-w")
;; (define-key global-map win:switch-prefix nil)
;; (define-key global-map "\C-za" 'win-switch-to-window)
(setq win:base-key ?`)		;; ` は「直前の状態」
(setq win:max-configs 27)	;; ` 〜 z は27文字
;; (setq win:quick-selection nil)	;; C-c英字 に割り当てない

;; 新しくフレームを作らない
(require 'windows)
(setq win:use-frame nil)
(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)
