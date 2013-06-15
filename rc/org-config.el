(add-hook 'org-mode-hook
	  (lambda ()
	    'turn-on-font-lock
	    (setq word-wrap 1)
	    (setq truncate-lines nil)
	    (flyspell-mode 1)))

(setq org-src-fontify-natively t)
(setq org-directory "~/.org/")
(setq org-default-notes-file (concat org-directory "refile.org"))

(setq org-agenda-files (quote ("~/.org/report.org"
                               "~/.org/ysacal.org"
                               "~/.org/personal.org")))
(setq org-capture-templates
      (quote (("t" "todo")
	      ("ts" "Stevens todo" entry (file+headline "~/.org/refile.org" "Steven")
	       "* %?%x" :clock-in t)
	      ("tb" "Brandons todo" entry (file+headline "~/.org/refile.org" "Brandon")
	       "* %?%x" :clock-in t)
	      ("h" "schedule" entry (file+headline "~/.org/refile.org" "")
	       "* TODO %?\nSCHEDULED: %^T")
	      ("n" "note" entry (file "~/.org/notes.org")
	       "* %? :NOTE:\n%a\n  %x"))))


(defun ab/emacs-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"

  (interactive)
  (when sound (shell-command
	       (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "

			     (if icon (concat "-i " icon) "")
			     " '" title "' '" msg "'"))
    ;; text only version

    (message (concat title ": " msg))))

;; the appointment notification facility
(setq appt-message-warning-time 10 ;; warn 10 min in advance
      appt-display-mode-line t     ;; show in the modeline
      appt-display-format 'window) ;; use our func
(appt-activate 1)              ;; active appt (appointment notification)
(display-time)                 ;; time display is required for this...

 ;; update appt each time agenda opened

(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)

(defun ab/appt-display (min-to-app new-time msg)
  (ab/emacs-popup (format "Appointment in %s minute(s)" min-to-app) msg 
	      "/usr/share/icons/gnome/32x32/status/appointment-soon.png"
	      "/usr/share/sounds/ubuntu/stereo/phone-incoming-call.ogg"))
(setq appt-disp-window-function (function ab/appt-display))

;; Timetracker frames
;;   - capture a task from any desktop/tag with a small emacs frame
;;     - call: emacsclient -e '(make-timetracker-frame)'
;;
;; Org-capture splits windows, force it to a single window
(add-hook 'org-capture-mode-hook  'delete-other-windows)

;; Automatic closing of timetracker frames
(defadvice org-capture-finalize (after delete-capture-frame activate)
  "Advise org-apture-finalize to close the frame if it is the timetracker frame"
  (if (equal "*Timetracker*" (frame-parameter nil 'name))
    (delete-frame))
)
(defadvice org-capture-destroy (after delete-capture-frame activate)
  "Advise org-capture-destroy to close the frame if it is the timetracker frame"
  (if (equal "*Timetracker*" (frame-parameter nil 'name))
    (delete-frame))
)

;; Initialization of time-track frames
(defun make-timetracker-frame ()
  "Create a new frame and ..."
  (interactive)
  (make-frame '((name . "*Timetracker*") (width . 80) (height . 15)))
  (select-frame-by-name "*Timetracker*")
  (org-capture)
  (delete-other-windows)
  (delete-other-windows)
)

;; Initialization of time-track frames
(defun ab/make-formfiller-frame ()
  "Create a new frame and ..."
  (interactive)
  (make-frame '((name . "*FormFiller*") (width . 160) (height . 50)))
  (select-frame-by-name "*FormFiller*")
  (delete-other-windows)
)

;; Convert HH:MM to mins
(defun ab/org-time-string-to-mins (s)
  "Convert a string HH:MM to a number of minutes."
  (cond
   ((and (stringp s)
         (string-match "\\([0-9]+\\):\\([0-9]+\\)" s))
    (let ((hour (string-to-number (match-string 1 s)))
          (min (string-to-number (match-string 2 s))))
      (+ (* hour 60) min)))
   ((stringp s) (string-to-number s))
   (t s)))

;; change awesome widget
(defun ab/awesome-task-widget ()
  "Update awesome widget with current task"
  (shell-command-to-string (format "echo 'orgtask.text = \"::<span color=\\\"\"..beautiful.fg_urgent..\"\\\">%s</span>\"' |awesome-client -" org-clock-current-task))
)

(add-hook 'org-clock-in-hook 'ab/awesome-task-widget)

;; Convert time-track table
(defun ab/prepare-report ()
  "Prepare report from time-tracker table"
  (interactive)
  (copy-to-register 73 (region-beginning) (region-end) nil)
  (with-temp-buffer
    (insert-register 73 nil)
    (org-table-goto-column 2)
    (org-table-delete-column)
    (org-table-move-column-left)
    (goto-char (point-min))
    (replace-regexp "\\s-*|$" "")
    (goto-char (point-min))
    (replace-regexp "^|" "- |")
    (clipboard-kill-region (point-min) (point-max))
    )
  )

(provide 'org-config)
