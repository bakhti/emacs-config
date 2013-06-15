;; emacs configuration

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("ea0c5df0f067d2e3c0f048c1f8795af7b873f5014837feb0a7c8317f34417b04" "ec33e0a8237e9be1275470f441cfbb1defd946466cb76a441bf06a9101cf43c0" "936e5cac238333f251a8d76a2ed96c8191b1e755782c99ea1d7b8c215e66d11e" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(load-path (cons (expand-file-name "~/.emacs.d/rc") load-path) t)
 '(mediawiki-site-alist (quote (("WikEmacs" "http://wikemacs.org/w/" "bakhti" "" "Main Page") ("wiki.techs.int" "https://wiki.techs.int/" "bakhti" "" "Заглавная страница"))))
 '(mediawiki-site-default "wiki.techs.int")
 '(org-agenda-files (quote ("~/.org/report.org"))))
(set-face-attribute 'default nil :height 115)

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("tromey" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'mediawiki)
(require 'magit)
(require 'yasnippet)
(yas-global-mode 1)

(require 'gnus-config)
(require 'bbdb-config)
(require 'buffer-config)
(require 'kbd-config)
(require 'visual-config)
(require 'org-config)

(setq make-backup-files nil)
(setq auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)

(desktop-save-mode 1)
(setq desktop-load-locked-desktop t)
(setq default-input-method "russian-computer")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
