(require 'haskell-mode-autoloads)

(add-hook 'haskell-mode-hook
	  '(lambda ()
             (haskell-indent-mode)
             ))
