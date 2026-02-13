;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (gtags-mode 1)
             (setq js-indent-level 2)
             (setq tab-width 2)
             (setq c-basic-offset 2)
             (setq js2-basic-offset 2)
             ))

(add-hook 'js-mode-hook
          '(lambda ()
             (gtags-mode 1)
             (setq tab-width 2)
             (setq js-basic-offset 2)
             (setq c-basic-offset 2)
             (setq js-indent-level 2)
             ))
