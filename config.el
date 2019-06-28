(eval-and-compile
  (setq gc-cons-threshold 402653184
        gc-cons-percentage 0.6))

(setq initial-major-mode (quote fundamental-mode))

(use-package doom-themes
	:diminish
	:ensure t
	:config (load-theme 'doom-one t)
)

(setq inhibit-splash-screen t
initial-buffer-choice  nil
)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq ring-bell-function 'ignore)

(setq display-time-24hr-format t)
(setq display-time-format "%d %B %Y - %H:%M")
(display-time-mode 1)

(use-package powerline
	:ensure t
	:diminish
	:init (powerline-center-theme)
)

(use-package neotree
	:ensure t
	:diminish
	:hook(prog-mode)
)

(setq-default frame-title-format '("Lucinda?"))

(set-frame-font "Consolas 12" nil t)

(use-package sr-speedbar
:init(with-eval-after-load "speedbar"
	(autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
)
)
;; fix so speedbar is in same window

(use-package column-enforce-mode
	:diminish
	:ensure t
	:hook (python-mode)
	:init (column-enforce-mode)
)

(use-package magit
:ensure t
:diminish
:hook(prog-mode org-mode)
)

(use-package git-gutter+
	:ensure t
	:diminish
	:hook(prog-mode . git-gutter+-mode)
	:bind ("C-x n" . "")
	("C-x n" . git-gutter+-next-hunk)
	("C-x p" .  git-gutter+-previous-hunk)
	("C-x v =" . git-gutter+-show-hunk)
	("C-x t" . git-gutter+-stage-hunks)
	("C-x c" . git-gutter+-commit)
	("C-x C" . git-gutter+-stage-and-commit)
	("C-x C-y" . git-gutter+-stage-and-commit-whole-buffer)
	("C-x U" . git-gutter+-unstage-whole-buffer)
)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
	(setq-default buffer-file-coding-system 'utf-8)
	(setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq make-backup-files nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package dashboard
:ensure t
:config(setq dashboard-startup-banner "~/.emacs.d/download.png")
(setq dashboard-banner-logo-title "Don't do the rain dance if you can't handle the thunder - Ken M")
(setq dashboard-items '((recents  . 3)
                        (bookmarks . 3)
                        (projects . 5)
                        (agenda . 0)
                        (registers . 0)))
(dashboard-setup-startup-hook)
)

(global-visual-line-mode)

(use-package flyspell-lazy
	:ensure t
	:hook (org-mode)
	:diminish
	:init (flyspell-lazy-mode 1)
)

(use-package which-key
	:ensure t
	:config (which-key-mode)
)

;; Spell Correct
(setq ispell-program-name "~/.emacs.d/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist`, please note it will be passed   to hunspell CLI as "-d" parameter
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
    '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))

(use-package define-word
	:diminish
	:ensure t
	:hook(org-mode)
	:bind ("C-x C-M-d" . define-word-at-point)
)

(use-package helm-ag
	:ensure t
	:bind("C-M-s" . helm-ag)
)

(use-package anzu
	:diminish
	:ensure t
	:bind
	("M-r" . anzu-query-replace-at-cursor)
	("C-r" . anzu-query-replace)
)

(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-unset-key "\C-x\C-c")

(setq org-startup-with-inline-images nil)

(setq org-latex-image-default-width "8cm")
(setq org-latex-image-default-height "8cm")
(setq org-latex-images-centered t)

(use-package org-download
	:ensure t
	:diminish
	:hook(org-mode)
	:config
	(setq-default org-download-heading-lvl nil)
	(org-toggle-inline-images)
	(setq-default org-download-image-dir "C:/users/lucam/pictures/orgimages/")
	:bind(:map org-mode-map ("C-M-y" . org-download-yank))
)

(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(use-package python
	:mode ("\\.py\\'" . python-mode)
)

(use-package virtualenvwrapper
	:ensure t
	:hook (python-mode)
	:config(venv-initialize-interactive-shells)
		(venv-initialize-eshell)
)

(use-package flycheck
	:ensure t
	:diminish
	:hook(python-mode . flycheck-mode)
)

(use-package eglot
	:ensure t
	:hook (python-mode)
	:diminish
)

(use-package blacken
	:ensure t
	:diminish
	:hook (python-mode)
)

(use-package pylint
	:ensure t
	:diminish
	:hook (python-mode)
)

(defun python-init()
	"Python-mode-hook"
	(yas-minor-mode)
	(company-mode)
)

(add-hook 'python-mode-hook 'python-init)

(add-hook 'python-mode-hook (lambda()
	(local-set-key (kbd "<f8>") (lambda()
		(pylint)
		(blacken-buffer)
	))
))

;; From https://github.com/valignatev/dotfiles/blob/literate-config/.emacs.d/config.org
(use-package company
	:custom
	(company-require-match nil)
	(company-minimum-prefix-length 1)
	(company-idle-delay 0.4)
	(company-tooltip-align-annotation t)
	(company-frontends '(company-pseudo-tooltip-frontend
			     company-echo-metadata-frontend))
	:hook ((prog-mode . company-mode))
	:bind (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous)))

(setq python-shell-interpreter "C:/Users/lucam/AppData/Local/Programs/Python/Python37-32/python.exe")

(defun create-java-project (project-name group-id)
	"Creates a java project with the necessary directory structure"
	(interactive "sProject Name:\nsGroup ID:")
	(shell-command (format "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-simple -DarchetypeVersion=1.4 -DinteractiveMode=false" group-id project-name))
)

(setq jdee-server-dir "~/.emacs.d/jdee-jar")

(add-hook 'java-mode-hook (lambda()
	(local-set-key (kbd "<f1>") 'jdee-debug)
	(local-set-key (kbd "<f2>") 'jdee-debug-set-breakpoint)
	(local-set-key (kbd "<f3>") 'jdee-debug-step-into)
	(local-set-key (kbd "<f4>") 'jdee-debug-cont)
	(local-set-key (kbd "<f6>") 'jdee-maven-build)
))

(use-package jdee
	:ensure t
	:diminish
	:defer t
)

(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))

(use-package zencoding-mode
	:ensure t
	:diminish
	:hook(html-mode . zenconding-mode)
	:bind("C-`" . zencoding-expand-line)
) 

(use-package web-beautify
	:ensure t
	:diminish
	:hook(html-mode)
)

(use-package yasnippet
	:ensure t
	:config
	(yas-reload-all)
	(yas-global-mode)
	(use-package yasnippet-snippets
		:ensure t
	)

)

(use-package auto-yasnippet
	:ensure t
	:diminish
 )

(use-package smart-compile
	:ensure t
	:diminish
	:hook(python-mode)
	:bind ("C-c C-c" . smart-compile)
)

(use-package ace-window
	:ensure t
	:diminish
	:bind("M-o" . ace-window)
)

(use-package find-file-in-project
	:ensure t
	:diminish
	:bind("C-x C-M-f" . find-file-in-project)
)

(add-hook 'prog-mode-hook (lambda()
	(local-set-key (kbd "C-<tab>") 'neotree-toggle)
))

(use-package multiple-cursors
	:ensure t
	:commands (mc/mark-next-like-this mc/mark-previous-like-this)
	:diminish 
	:bind
	("C->" . mc/mark-next-like-this)
	("C-<" . mc/mark-previous-like-this)
)

(use-package ace-mc
	:ensure t
	:commands (ace-mc-add-multiple-cursors)
	:diminish
	:bind
	("C-M->" . ace-mc-add-multiple-cursors)
	("C-M-<" . ace-mc-add-multiple-cursors)
)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(use-package helm
	:ensure t
	:diminish
	:bind
	("C-s" . helm-swoop)
	("C-x a s" . helm-multi-swoop-all)
	("M-y" . helm-show-kill-ring)
	("C-x r m" . helm-bookmarks)
	("C-x C-b" . helm-buffer-list)
	("C-x C-f" . helm-find-files)
)

(use-package ace-jump-mode
	:ensure t
	:bind("C-z" . ace-jump-mode)
)

(use-package helm-org-rifle
	:ensure t
	:diminish
	:hook (org-mode)
	:bind(:map org-mode-map
	("C-s" . helm-org-rifle)
	("M-s" . helm-org-rifle-org-directory))
)

(add-hook 'org-mode-hook (lambda()
	(local-set-key (kbd "C-<return>") 'ispell-word)
))

(global-set-key (kbd "C-M-g") 'query-replace-regexp)
(use-package smex
	:ensure t
	:diminish
	:bind("M-x" . smex)
)
(global-set-key (kbd "C-|") 'comment-box)
(global-set-key (kbd "C-M-|") 'uncomment-region)

(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)
