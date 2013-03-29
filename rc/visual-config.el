(setq inhibit-startup-message t)
(show-paren-mode t)
(load-theme 'tango-dark)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(setq menu-bar-mode nil)
(setq tool-bar-mode nil)
(setq kill-whole-line t)

;(setq default-frame-alist '((font . "DejaVu Sans Mono-12")
;			    (menu-bar-lines . 0)
;			    (tool-bar-lines . 0)))
;(setq initial-frame-alist default-frame-alist)
;(setq special-display-frame-alist default-frame-alist)

;(let ((color-theme-is-global nil))
;  (if (window-system)
;      (color-theme-zenburn)
;    (color-theme-tty-dark)))

;(defun my-new-frame-colours(frame)
;  "Set the colour scheme of a new frame"
;  (let ((color-theme-is-global nil))
;    (select-frame frame)
;    (if (window-system frame)
;	(color-theme-zenburn)
;      (color-theme-tty-dark))))
  
; Lets hook into the frame function
;(add-hook 'after-make-frame-functions 'my-new-frame-colours)

; Transparancy (xcompmgr required)
(defun my-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

(provide 'visual-config)
