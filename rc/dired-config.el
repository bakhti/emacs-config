;; Allow me to delete non-empty directories; use with caution
(setq dired-recursive-deletes t)
(setq dired-listing-switches "-alFh")

(when (load "dired-x" t)
  ;; The dired-x package allows me to omit backup files
  (add-hook 'dired-load-hook (function (lambda ()
                                         (setq dired-guess-shell-gnutar "tar"))))
  (add-hook 'dired-mode-hook (function (lambda ()
                                         (setq dired-omit-files-p t)))))

(provide 'dired-config)
