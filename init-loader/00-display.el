
;; 色付け
(global-font-lock-mode t)

;; モードラインに日時を表示
(setq display-time-day-and-date t
      display-time-24hr-format t)
(setq display-time-string-forms
      '((if display-time-day-and-date
	    (format "%s/%s/%s " year month day)
	  "")
	(format "%s:%s%s"
		(if display-time-24hr-format 24-hours 12-hours)
		minutes
		(if display-time-24hr-format "" am-pm))))
(display-time)

;; 現在行をハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; リージョンの強調表示
(transient-mark-mode)
(setq highlight-nonselected-windows t)

