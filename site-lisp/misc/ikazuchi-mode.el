;;; ikazuchi-mode.el --- ikazuchi, translate using web APIs, minor mode.        
;;;                                                                             
;;; Currently can use only Google.                                              
;;;                                                                             

(provide 'ikazuchi-mode)

;; set path to ikazuchi if you have not set PATH.                               
(defvar ikazuchi-path "ikazuchi")

;; Translated from                                                              
(defvar ikazuchi-from "en")
;; Translated to                                                                
(defvar ikazuchi-to "ja")
;; Encoding in/out                                                              
(defvar ikazuchi-encoding "utf-8")



(easy-mmode-define-minor-mode ikazuchi-mode
                              "Ikazuchi is helper script that can translate document using web               
translate APIs. Ikazuchi mode is a minor-mode of using ikazuchi on the Emacs.   
                                                                                
key  binding                                                                    
---  -------                                                                    
M-r  translate region                                                           
M-l  translate current line                                                     
"
                              nil ;; default = off                                                          
                              "ikazuchi" ;; mode-line                                                       
                              '(("\M-r" . ikazuchi-region)
                                ("\M-l" . ikazuchi-line))
                              )


(defun ikazuchi-region ()
  "translate region"
  (interactive)
  (let ((buf (buffer-substring-no-properties 
              (region-beginning) (region-end)
              )))
    (goto-char (region-end))
    (pop-mark)
    (ikazuchi-invoke buf)
    )
  )

(defun ikazuchi-line ()
  "translate current line"
  (interactive)
  (let ((buf (buffer-substring-no-properties 
              (line-beginning-position)
              (line-end-position)
              )))
    (goto-char (line-end-position))
    (ikazuchi-invoke buf)
    )
  )

(defun ikazuchi-invoke (sentence)
  "invoke ikazuchi and insert the result "
  (if (>= (length sentence) 1)
      (let* ((buf (shell-command-to-string 
                   (concat ikazuchi-path 
                           " -q -s \""
                           sentence
                           "\" -e "
                           ikazuchi-encoding
                           " -f "
                           ikazuchi-from
                           " -t " 
                           ikazuchi-to)
                   ))
             (bufname (get-buffer-create "*ikazuchi*"))
             (curwin (selected-window))
             (newwin (display-buffer bufname))
             )

        (set-buffer bufname)
        (insert (concat sentence
                        "\n -> "
                        (car (reverse (split-string (replace-regexp-in-string "\s*\n?$" "" buf) " ")))
                        "\n\n"))
        (goto-char 0)
        (message "Powered by Google.")
        )
    )
  )

