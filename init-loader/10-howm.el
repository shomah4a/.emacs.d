
;; howm のメモタイトルを = から * に
;; (setq howm-view-title-header "*") ;; ← howm のロードより前に書くこと

;;
;; imcap + WinShot
;; howm で画像貼り付け
;;
(setq imcap-capture-command-format
      "WinShot.exe -Jpeg -Rectangle -Close -File %s")

;; imcap をロード
(autoload 'imcap-capture "imcap"
  "Hitori Otegaru Wiki Modoki image capture" t)
(autoload 'imcap-display "imcap"
  "Hitori Otegaru Wiki Modoki image capture" t)
(add-hook 'howm-view-open-hook 'imcap-display)

;;
;; howm ( 一人お手軽 wiki もどき )
;;
;; (global-set-key "\C-z,," 'howm-menu)
(global-set-key "\C-z,," 'howm-menu)
(setq howm-prefix "\C-z,")

(setq howm-directory "~/.howm/")
(setq howm-menu-file (concat howm-directory ".menu"))
(setq howm-keyword-file (concat howm-directory ".keys"))
(setq howm-history-file (concat howm-directory ".history"))

(setq howm-menu-lang 'ja)
(require 'howm)

;; howm のテンプレート
(setq howm-template "= %title%cursor\n%date\n%file\n\n")

;; grep を検索で使用
;; (setq howm-view-use-grep t)

;; howm のキーワード一覧を返す関数
(defun my-howm-keyword-filter (lst)
  (if (= (length lst) 0) ""
    (if (= (length lst) 1) (car lst)
      (if (car lst)
	  (concat (car lst) "\n" (my-howm-keyword-filter (cdr lst)))
	  (my-howm-keyword-filter (cdr lst))
))))

(defun my-howm-keyword-list ()
  (my-howm-keyword-filter
   (mapcar
    '(lambda (str)
       (if (string-match "^%\\(.*\\)%" str) nil str))
    (howm-keyword-list))
))

;; howm で関数を使えるように
(setq howm-menu-allow (append '(format-time-string my-howm-keyword-list) howm-menu-allow))


(defun my-howm-dropfile (file)
  (print file)
  (let ((cfile))
    ;; ドラッグされたファイルをカレントディレクトリにコピーする
    ;; さらにファイル名のフォーマットを時間から得ることで重複を防ぐ
    (setq cfile (format-time-string (format "%s.%s" "%Y-%m-%d-%H%M%S"
                                            (file-name-extension file nil))
                                    (current-time)))
    (copy-file file cfile)
    (insert (format howm-template-file-format cfile) "\n")))


;; メモ中に Shift + 画像ドロップで貼り付けることが出来る
(when (eq window-system 'w32)
  (defun howm-w32-dnd-ref-file (event)
    "Add ref to drop files."
    (interactive "e")
    (mapc
     #'my-howm-dropfile
     (car (cdr (cdr event)))))
  (eval-after-load "howm-mode"
    '(progn
       (define-key howm-mode-map [drag-n-drop] 'howm-w32-dnd-ref-file))))


;; DnD の Linux 版
(when (eq window-system 'x)
  (defadvice dnd-open-local-file (around dnd-open-local-file-around (uri action))

    ;; howm モードが有効ならば
    (if (eq howm-mode t)
        ;; dnd.el からコピペ
        (let ((f (cond ((string-match "^file:///" uri)	; XDND format.
                        (substring uri (1- (match-end 0))))
                       ((string-match "^file:" uri)		; Old KDE, Motif, Sun
                        (substring uri (match-end 0))))))

          ;; 読み込んで貼り付ける関数
          (my-howm-dropfile f))
      ;; アドバイスした元の関数を呼ぶらしい
      ad-do-it
      )
    )
  (ad-activate 'dnd-open-local-file)
)


;; howm のメモ検索で jpg を検索しないように
(setq
 howm-excluded-file-regexp
 (concat
  "\\(^\\|/\\)\\([.]\\|CVS/\\)\\|"
  "[~#]$\\|"
  "\\.\\("
  (mapconcat
   (lambda (f) f)
   '(
     "doc" "pdf" "ppt" "xls"
     "bak" "elc" "gz" "aux"
     "toc" "idx" "dvi" "jpg"
     "gif" "png"
     ) "\\|") "\\)$"))


;; RET でファイルを開く際, 一覧バッファを消す
;; C-u RET なら残る
(setq howm-view-summary-persistent nil)

;; <<< で大文字小文字の区別無し
(setq howm-keyword-case-fold-search t)

;; imcap で貼り付けた画像を消す際にファイルも削除
(defadvice kill-region
  (around delete-image-file activate)
  (when (and (boundp 'howm-mode)
             howm-mode)
    (let ((str
           (split-string
            (buffer-substring-no-properties
             (ad-get-arg 0)
             (ad-get-arg 1)) "[\n\r]+"))
          (line nil)
          (imagefile nil))
      (while str
        (setq line (car str))
        (if (string-match
             ">>> \\(.*\\.\\(jpg\\|png\\|gif\\)\\)"
             line)
            (setq imagefile (match-string 1 line)))
        (when (and imagefile
                   (file-exists-p
                    (expand-file-name imagefile)))
          (if (y-or-n-p
               (format
                "Delete image file %s?" imagefile))
              (progn
                (setq imagefile
                      (expand-file-name imagefile))
                (delete-file imagefile))))
        (setq imagefile nil)
        (setq str (cdr str)))))
  ad-do-it)

;; 画像の拡大縮小 F11 & F12
(autoload 'imcap-image-downsize "imcap"
  "imcap" t)
(autoload 'imcap-image-upsize "imcap"
  "imcap" t)

(eval-after-load "howm-mode"
  '(progn
     (define-key howm-mode-map [f11]
       'imcap-image-downsize)
     (define-key howm-mode-map [f12]
       'imcap-image-upsize)
     ))


;;
;; 色設定
;;
(set-face-foreground 'howm-mode-title-face "light blue")
(set-face-foreground 'howm-reminder-normal-face "light blue")

;; org モードを *.howm の編集に使う
(require 'org)
;; (add-hook 'org-mode-hook 'howm-mode)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

