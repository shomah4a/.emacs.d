;; compilation-start をゴニョる
(defadvice compilation-start (before compilation-start-before (command &optional mode name-function highlight-regexp))

  (if (null name-function)
      (setq name-function
            (lambda (name)
              (concat "*"
                      name
                      " \""
                      command
                      "\"*"))))
  )
(ad-activate 'compilation-start)


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
