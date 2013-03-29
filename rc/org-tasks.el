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

(provide 'org-tasks)
