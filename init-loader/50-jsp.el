;;; 50-jsp.el --- mode setting for jsp

(setq auto-mode-alist (cons '("\\.jsp$" . xml-mode) (cons '("\\.tag$" . xml-mode) auto-mode-alist)))

