(require 'ibuffer)

(setq ibuffer-formats '((mark modified read-only " " (name 16 16) " "
                              (size 6 -1 :right) " " (mode 16 16 :center)
                              " " (process 8 -1) " " filename)
                        (mark " " (name 16 -1) " " filename))
      ibuffer-show-empty-filter-groups nil)

(defun my-ibuffer-mode-hook ()
  (hl-line-mode 1))
(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook)

;; default groups for ibuffer
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("web" (mode . w3m-mode))
               ("кодинг" (or (mode . cperl-mode)
			     (mode . lisp-mode)
			     (mode . emacs-lisp-mode)
			     (mode . python-mode)
			     (mode . sh-mode)
			     (mode . ruby-mode)
			     (mode . js-mode)
			     (mode . lua-mode)
			     (mode . html-mode)
			     (mode . css-mode)
			     (mode . xml-mode)
			     (mode . help-mode)
			     (mode . magit-mode)
			     (mode . info)
			     (mode . conf-unix-mode)
			     (mode . conf-colon-mode)
			     (mode . puppet-mode)
			     (mode . eshell-mode)
			     (mode . dot-mode)))
               ("общение" (or (mode . erc-mode)
			      (name . "^\\*-jroster-\\*$")
			      (name . "^\\*-jc-")
			      (name . "^\\*-jg-")))
	       ("планирование" (or (mode . org-mode)
				   (name . "^\\*Calendar\\*$")
				   (name . "^diary$")))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("почта" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
			(mode . wl-folder-mode)
			(mode . wl-summary-mode)
			(mode . wl-draft-mode)
			(mode . mime-view-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))

;; ibuffer, I like my buffers to be grouped
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups
             "default")))

;;; bubble-buffer
;(require 'bubble-buffer)
;(setq bubble-buffer-omit-regexp "\\(^ .+$\\|\\*Messages\\*\\|\\*compilation\\*\\|\\*.+output\\*$\\|\\*TeX Help\\*$\\|\\*vc-diff\\*\\|\\*Occur\\*\\|\\*grep\\*\\|\\*cvs-diff\\*\\)")

;;;ido
(require 'ido)
(ido-mode t)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

(provide 'buffer-config)
