(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-archives (quote (("org" . "http://orgmode.org/elpa/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "https://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))))

(add-to-list 'after-init-hook (lambda ()
				(require 'init-loader)
				(substitute-in-file-name "$HOME/.emacs.d/init-loader")
				(init-loader-load (substitute-in-file-name "$HOME/.emacs.d/init-loader"))
				))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
