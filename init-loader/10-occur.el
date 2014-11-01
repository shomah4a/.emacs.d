;; occur-mode
;; 元のバッファで追従させる
(add-hook 'occur-mode-hook
          '(lambda ()
             (next-error-follow-minor-mode)))


;; occur-1 をゴニョる
(defadvice occur-1 (before occur-1-before (regexp nlines bufs &optional buf-name))
  (if (null buf-name)
      (setq buf-name
            (concat "*Occur \""
                    (buffer-name (current-buffer))
                    "("
                    regexp
                    ")\"*")))
  )
(ad-activate 'occur-1)

