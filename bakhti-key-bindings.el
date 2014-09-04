;(global-set-key (kbd "C-s-SPC") 'bakhti/mode-line-in-header)

;; Killing text
(global-set-key (kbd "C-S-k") 'bakhti/kill-and-retry-line)
(global-set-key (kbd "C-w") 'bakhti/kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'bakhti/kill-to-beginning-of-line)

;; Clever newlines
(global-set-key (kbd "C-o") 'bakhti/open-line-and-indent)
(global-set-key (kbd "<C-return>") 'bakhti/open-line-below)
(global-set-key (kbd "<C-S-return>") 'bakhti/open-line-above)
(global-set-key (kbd "<M-return>") 'bakhti/new-line-dwim)

;; Navigation bindings
(global-set-key [remap goto-line] 'bakhti/goto-line-with-feedback)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

(define-prefix-command 'bakhti/toggle-map)
;; The manual recommends C-c for user keys, but I like using C-x for global keys and using C-c for mode-specific keys.
(define-key ctl-x-map "t" 'bakhti/toggle-map)
(define-key bakhti/toggle-map "r" 'read-only-mode)
(define-key bakhti/toggle-map "l" 'toggle-truncate-lines)
(define-key bakhti/toggle-map "o" 'org-mode)
(define-key bakhti/toggle-map "v" 'visual-line-mode)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'bakhti/eval-and-replace)

(global-set-key (kbd "C-c s") 'bakhti/swap-windows)

;;
(eval-after-load 'yaml-mode
  '(define-key yaml-mode-map (kbd "C-c h a") 'bakhti/ansible-doc))

;; shorthand for interactive lambdas
(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

(global-set-key (kbd "s-l") (λ (insert "\u03bb")))

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'bakhti-key-bindings)
;; Local Variables:
;; mode: emacs-lisp
;; mode: allout
;; outline-regexp: "^;;;_\\([,. ]+\\)"
;; End:
;;; bakhti-key-bindings.el ends here
