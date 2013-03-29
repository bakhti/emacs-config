;; emacs configuration

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(load-path (cons (expand-file-name "~/.emacs.d/rc") load-path) t)
 '(mediawiki-site-alist (quote (("WikEmacs" "http://wikemacs.org/w/" "bakhti" "" "Main Page") ("wiki.techs.int" "https://wiki.techs.int/" "bakhti" "" "Заглавная страница"))))
 '(mediawiki-site-default "wiki.techs.int")
 '(org-agenda-files (quote ("~/.org/report.org"))))
(set-face-attribute 'default nil :height 115)

(require 'package)
(setq package-archives '(("tromey" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq el-get-sources
      '(el-get bbdb lua-mode apel flim semi wanderlust emacs-jabber mediawiki
	       (:name magit
		      :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
	       (:name graphviz-dot-mode
;		      :type http
;		      :url "http://users.skynet.be/ppareit/projects/graphviz-dot-mode/graphviz-dot-mode.el"
;		      :features graphviz-dot-mode
		      :post-init (lambda ()
				   (add-to-list 'auto-mode-alist
						'("\\.dot\\.gv\\'" . graphviz-dot-mode))))
	       (:name mediawiki
		      :autoloads t)))

(el-get)

(require 'gnus-config) ;; wl-config)
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
