;; Emacs package system
(require 'package)
(setq package-user-dir (concat user-emacs-directory "elpa"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(package-refresh-contents)

(defvar my/install-packages
  '(
    ;; package management
    use-package

    ;; themeing
    rainbow-mode
    moe-theme powerline

    ;; misc
    diminish

    ;; IRC/ERC and social stuff
    erc-hl-nicks ercn todochiku twittering-mode

    ;; for auto-complete
    company

    ;; editing utilities
    expand-region ido-ubiquitous ido-vertical-mode flx-ido projectile
    ace-jump-mode multiple-cursors

    ;; buffer utils
    popwin

    ;; flycheck
    ;; flycheck flycheck-tip

    ;; python
    ;; hy-mode jedi

    ;; ruby
    ;; ruby-mode ruby-test-mode inf-ruby puppet-mode rbenv

    ;; markup language
    markdown-mode yaml-mode

    ;; git
    magit git-timemachine
    ))

;; org-mode is forced manually
(package-install 'org)

(dolist (pack my/install-packages)
  (unless (package-installed-p pack)
    (package-install pack)))
