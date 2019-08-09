(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq package-enable-at-startup nil
      file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      auto-window-vscroll nil)

(add-hook 'after-init-hook
          `(lambda ()
             (setq file-name-handler-alist file-name-handler-alist-old
                   gc-cons-threshold 800000
                   gc-cons-percentage 0.1)
             (garbage-collect)) t)

(setq initial-major-mode (quote fundamental-mode))

(use-package benchmark-init
:ensure t
:init(benchmark-init/activate)
)

(use-package doom-themes
	:diminish
	:ensure t
	:config (load-theme 'doom-city-lights t)
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

(setq-default frame-title-format '("Lucinda?"))

(set-frame-font "Consolas 14" nil t)

(use-package sr-speedbar
	:ensure t
	:bind("C-<tab>" . sr-speedbar-toggle)
	:config(with-eval-after-load "speedbar"
		(autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
	)
)
;; fix so speedbar is in same window

(use-package helm-posframe
	:ensure t
	:init(helm-posframe-enable)
	:custom(helm-posframe-parameters '(
	(left-fringe . 10)
	(right-fringe . 10)
))
)

(use-package magit
	:ensure t
	:defer t
	:diminish
	:bind(:map prog-mode-map
		("C-c t" . magit-stage-file)
		("C-c s" . magit-status)
		("C-c c" . magit-commit-create)
	)
)

(use-package vc
	:no-require t
	:defer t
	:commands(vc diff)
	:bind("C-c d" . vc-diff)
)

(use-package git-gutter
	:ensure t
	:diminish
	:defer t
	:hook (prog-mode . git-gutter-mode)
	:hook (magit-post-refresh . git-gutter:update-all-windows)
	:bind(:map prog-mode-map
		("C-c n" . git-gutter:next-hunk)
 		("C-c p" . git-gutter:previous-hunk)
)
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
	:diminish
	:defer t
)

(use-package which-key
	:ensure t
	:diminish
	:config (which-key-mode)
)

(use-package ispell
	:no-require t
	:defer t
	:custom
	(ispell-program-name "~/.emacs.d/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
	(ispell-local-dictionary "en_US")
	(ispell-local-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
	:bind (:map org-mode-map("C-<return>" . ispell-word))
)

(use-package define-word
	:diminish
	:ensure t
	:defer t
)

(use-package helm-ag
	:ensure t
	:diminish
	:bind("C-M-s" . helm-ag)
)

(use-package anzu
	:diminish
	:ensure t
	:bind
	("M-r" . anzu-query-replace-at-cursor)
)

(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-unset-key "\C-x\C-c")

(use-package org
	:mode("\\.org\\'" . org-mode)
	:custom
	(org-startup-with-inline-images nil)
	(org-latex-image-default-width "8cm")
	(org-latex-image-default-height "8cm")
	(org-latex-images-centered t)
	(org-latex-pdf-process
		'("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
	(org-latex-toc-command "\\tableofcontents \\clearpage")
)

(use-package company
	:ensure t
	:diminish
	:hook((web-mode css-mode c-mode) . company-mode)
	:custom(comany-idle-delay 0.3)
)

(use-package company-web
	:ensure t
	:diminish
	:after company
)

(use-package company-irony
	:ensure t
	:diminish
	:after company
)

(use-package irony
	:ensure t
	:diminish
	:hook(c-mode . irony-mode)
	:custom(w32-pipe-read-delay 50)
)

(use-package python
	:mode("\\.py\\'" . python-mode)
)

(use-package virtualenvwrapper
	:ensure t
	:hook (python-mode . venv-initialize-interactive-shells)
	:hook (python-mode . venv-initialize-eshell)
)

(use-package flycheck
	:ensure t
	:commands (flycheck-mode
	  flycheck-next-error
	  flycheck-previous-error)
	:diminish
	:hook(python-mode . flycheck-mode)
)

(use-package smart-compile
	:ensure t
	:bind(:map python-mode-map
		("C-c C-c" . smart-compile)
	)
)

(use-package blacken
	:ensure t
	:diminish
	:defer t
)

(use-package pylint
	:ensure t
	:diminish
	:defer t
)

(use-package jedi
	:ensure t
	:hook(python-mode . jedi:setup)
)

(defun create-java-project (project-name group-id)
	"Creates a java project with the necessary directory structure"
	(interactive "sProject Name:\nsGroup ID:")
	(shell-command (format "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-simple -DarchetypeVersion=1.4 -DinteractiveMode=false" group-id project-name))
)

(use-package jdee
	:diminish
	:mode("\\.java\\'" . jdee-mode)
	:bind
	(:map jdee-mode-map
		("<f1>" . jdee-debug)
		("<f2>" . jdee-debug-set-breakpoint)
		("<f3>" . jdee-debug-step-into)
		("<f4>" . jdee-debug-cont)
		("<f6>" . jdee-maven-build)
	)
	:custom(jdee-server-dir "~/.emacs.d/jdee-jar")
)

(use-package web-mode
	:ensure t
	:mode("\\.html\\'")
	:config(web-mode-toggle-current-element-highlight)
	:bind(:map web-mode-map
	("C-c C-e -" . web-mode-element-contract)
	("C-c C-e +" . web-mode-element-extract)
	("C-c C-e /" . web-mode-element-close)
	("C-c C-e a" . web-mode-element-content-select)
	("C-c C-e i" . web-mode-element-insert)
	("C-c C-e w" . web-mode-element-wrap)
	("C-c C-e k" . web-mode-element-kill)
)
)

(use-package css-mode
	:ensure t
	:mode("\\.css\\'")
)

(use-package css-comb
	:ensure t
	:commands (css-comb)
)

(use-package simple-httpd
	:no-require t
	:after web-mode
	:ensure t
	:diminish
	:hook(web-mode . httpd-start)
)

(use-package impatient-mode
	:ensure t
	:hook((web-mode css-mode) . impatient-mode)
)

(use-package zencoding-mode
	:ensure t
	:diminish
	:hook(web-mode . zencoding-mode)
	:bind(:map web-mode-map("C-`" . zencoding-expand-line))
)

(use-package web-beautify
	:ensure t
	:diminish
	:defer t
)

(use-package yasnippet
	:ensure t
	:hook(prog-mode . yas-global-mode)
	:bind*("C-~" . yas-insert-snippet)
	:config
	(yas-reload-all)
	(use-package yasnippet-snippets
		:ensure t
	)
)

(use-package auto-yasnippet
	:ensure t
	:after yasnippet
	:commands(aya-create aya-expand aya-open-line)
	:diminish
)

(use-package smart-compile
	:ensure t
	:diminish
	:bind (:map prog-mode-map
	("C-c C-c" . smart-compile))
)

(use-package so-long
	:load-path("~/.emacs.d/elpa/")
	:commands global-so-long-mode
	:init(global-so-long-mode)
)

(use-package ace-window
	:ensure t
	:diminish
	:commands ace-window
	:bind("M-o" . ace-window)
)

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
	("C-s" . helm-occur)
	("M-y" . helm-show-kill-ring)
	("C-x r m" . helm-bookmarks)
	("C-x C-b" . helm-buffers-list)
	("C-x C-f" . helm-find-files)
)

(use-package ace-jump-mode
	:ensure t
	:bind
	("C-z" . ace-jump-mode)
	("M-z" . ace-jump-mode-pop-mark)
)

(global-set-key (kbd "C-M-g") 'query-replace-regexp)
(use-package smex
	:ensure t
	:diminish
	:bind("M-x" . smex)
)

(use-package simple
	:no-require t
	:hook(before-save . delete-trailing-whitespace)
)

(use-package isearch
	:no-require t
	:bind
	("M-s" . isearch-forward)
	("M-r" . isearch-backward)
)

(use-package tramp :defer t)
(use-package with-editor :defer t)
(use-package org-agenda :defer t)
(use-package speedbar :defer t)
(use-package gud :defer t)
(use-package all-the-icons :defer t)

(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)
