;;; 50-php.el --- settings for php

;; Copyright (C) 2016  shoma

;; Author: shoma <shoma@shoma-VirtualBox>
;; Keywords:

(require 'php-completion)

(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (gtags-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t))))
