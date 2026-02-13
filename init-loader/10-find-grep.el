;; find-grep カスタマイズ
(custom-set-variables
 '(grep-find-command "find . -iname '*' ! -wholename '*/.svn/*' -print0 | xargs -0 -e grep -nHi ")
)


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

