;;; emacs-rc-kbd.el --- 

(global-set-key [(control tab)] `other-window)
;;(global-set-key (kbd "\e\ed") 'dictionary-search)
(global-set-key (kbd "\e\eg") 'goto-line)
(global-set-key (kbd "\e\es") 'eshell)
(global-set-key (kbd "\e\ee") 'erc-select)
(global-set-key (kbd "\e\ej") 'jabber-connect)
(global-set-key (kbd "\e\ew") 'w3m-goto-url-new-session)
(global-set-key (kbd "\e\em") 'magit-status)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> n") 'org-narrow-to-subtree)
(global-set-key (kbd "<f9> w") 'widen)
(global-set-key (kbd "<f9> r") 'ab/prepare-report)
;(global-set-key [f6] 'bubble-buffer-next)
;(global-set-key [(shift f6)] 'bubble-buffer-previous)
(define-key global-map (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key "\C-x\C-a" 'jabber-activity-switch-to)
(global-set-key (kbd "\e\er") 'jabber-switch-to-roster-buffer)

;; Org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)

;; Kill-server
(defun my-kill-emacs ()
  (interactive)
  (save-some-buffers)
  (desktop-save-in-desktop-dir)
  (kill-emacs))

(global-set-key (kbd "C-x c") 'my-kill-emacs)

;; Comment/uncomment line/region
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)

;; Opacity bindings
(global-set-key (kbd "C-8") '(lambda()(interactive)(my-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(my-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

(provide 'kbd-config)
