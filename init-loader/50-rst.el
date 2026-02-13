;; reStructuredText 用
(setq frame-background-mode 'dark)


;; rst-goto-section をゴニョる
;; rst-toc で作った toctree から飛ぶときに閉じないように
(defadvice rst-goto-section (before rst-goto-section-before (&optional kill))
  (setq kill nil)
  )
(ad-activate 'rst-goto-section)

(defun rst-toc-next-line ()
  (interactive)
  (next-line)
  (rst-goto-section)
  )

(defun rst-toc-previous-line ()
  (interactive)
  (previous-line)
  (rst-goto-section)
  )

(defadvice rst-toc (after rst-toc-after ())
  (local-set-key [?\C-n] 'rst-toc-next-line)
  (local-set-key [?\C-p] 'rst-toc-previous-line)
  )

(ad-activate 'rst-toc)

