(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(tsdh-dark))
 '(git-commit-fill-column 512)
 '(grep-find-command
   "find . -iname '*' ! -wholename '*/.svn/*' -print0 | xargs -0 -e grep -nHi ")
 '(package-archives
   '(("org" . "http://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(markdown-preview-mode terraform-mode s3ed gradle-mode kotlin-mode typescript typescript-mode howm twig-mode theme-changer tabulated-list sequential-command scheme-here scala-mode python-mode puppet-mode protobuf-mode php-mode php-completion pallet migemo markdown-mode malabar-mode js2-mode ipython init-loader haskell-mode gtags groovy-mode go-mode git-rebase-mode git-commit-mode git-blame fsharp-mode feature-mode ein dockerfile-mode csv-mode crontab-mode calfw browse-kill-ring auto-complete-rst anything 2048-game))
 '(read-file-name-completion-ignore-case t))

(add-to-list 'after-init-hook (lambda ()
				(require 'init-loader)
				(init-loader-load (substitute-in-file-name "$HOME/.emacs.d/init-loader"))
				))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
