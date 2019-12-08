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
  :init(benchmark-init/activate))

(delete-selection-mode 1)

(setq package-enable-at-startup nil)

(setq site-run-file nil)

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

(use-package dashboard
:ensure t
:config(setq dashboard-startup-banner "~/.emacs.d/images/KEC_Dark_BK.png")
(setq dashboard-banner-logo-title "Don't do the rain dance if you can't handle the thunder - Ken M")
(setq dashboard-items '((recents  . 3)
                        (bookmarks . 3)
                        (projects . 5)
                        (agenda . 0)
                        (registers . 0)))
(dashboard-setup-startup-hook)
)

(use-package beacon
	:ensure t
	:config
		(beacon-mode 1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package powerline			 ;;
;; 	:ensure t				 ;;
;; 	:diminish				 ;;
;; 	:init (powerline-center-theme)		 ;;
;; )						 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default
frame-title-format '("Lucinda?"))

(set-frame-font "Consolas 14" nil t)

(use-package neotree
	:ensure t
	:diminish
	:bind*("C-<tab>" . neotree-toggle)
)

(use-package awesome-pair
	:load-path("~/.emacs.d/elpa/")
	:hook( (org-mode prog-mode) . awesome-pair-mode)
	:bind
	("(" . awesome-pair-open-round)
	("(" . awesome-pair-open-round)
	("[" . awesome-pair-open-bracket)
	("{" . awesome-pair-open-curly)
	("=" . awesome-pair-equal)
	("M-\"" . awesome-pair-wrap-double-quote)
	("M-[" . awesome-pair-wrap-bracket)
	("M-{" . awesome-pair-wrap-curly)
	("M-(" . awesome-pair-wrap-round)
	("M-)" . awesome-pair-unwrap)
)

(use-package projectile
	:ensure t
	:init(projectile-mode)
	(require 'cc-mode)
	:bind("C-x r p" . projectile-switch-project)
		 ("C-x C-M-f" . projectile-find-file)
		 ("C-x C-M-s" . projectile-save-project-buffers)
	:bind(:map c-mode-base-map
		("<f1>" . projectile-compile-project))
		("<f2>" . luca/c-debug)
)

(use-package helm-projectile
	:ensure t
	:after projectile
	:init(helm-projectile-on)
)

(use-package magit
	:ensure t
	:diminish
	:commands(magit-stage-file magit-status magit-commit-create)
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

(global-visual-line-mode)

(use-package which-key
	:ensure t
	:diminish
	:config (which-key-mode)
	)

(use-package ispell
	:no-require t
	:defer t
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

;; (defun youtube-to-mp3 (song-url)
;; 	"Downloads a song off youtube in mp3 format"
;; 	(interactive "sSong url: ")
;; 	(shell-command (format "youtube-dl -x --audio-format mp3 %s" song-url))
;; )

(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-unset-key "\C-x\C-c")

(use-package fill
	:no-require t
	:bind("<f9>" . fill-region )
)

(use-package terminal-here
	:ensure t
	:commands(terminal-here terminal-here-launch terminal-here-project-launch)
)

(use-package org
	:mode("\\.org\\'" . org-mode)
	:bind(:map org-mode-map
		("<f1>" . org-export-dispatch)
	)
	:custom
	(org-startup-with-inline-images nil)
	(org-latex-listings 'minted)
	(org-latex-packages-alist '(("" "minted")))
	(org-latex-minted-options
		'(
			("frame" "lines")
			("linenos" "")
		))
	(org-latex-pdf-process
	'("pdflatex -shell-escape -interaction=nonstopmode %f"
	"pdflatex -shell-escape -interaction=nonstopmode %f"
	))
	(org-latex-toc-command "\\tableofcontents \\clearpage")
)

;; Call load ox-latex only when exporting
(use-package ox-latex
	:no-require t
	:commands org-export-dispatch
)

(use-package helm-org-rifle
	:ensure t
	:bind(:map org-mode-map
	("M-s" . helm-org-rifle-org-directory)
)
)

(use-package ox-twbs
	:ensure t
	:defer t
)

(use-package org-wc
	:ensure t
	:commands(org-wc-display)
)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(use-package dap-mode
	:ensure  t
	:diminish
	:defer t
	:commands(dap-mode)
)

(use-package company
	:ensure t
	:diminish
	:hook((web-mode css-mode c-mode-common) . company-mode)
	:custom(comany-idle-delay 0.1)
)

(use-package company-web
	:ensure t
	:diminish
	:after company
)

(use-package company-lsp
  :defer t
  :after lsp
  :custom (company-lsp-cache-candidates 'auto)

)

(use-package company-quickhelp
	:ensure t
	:diminish
	:hook (company-mode . company-quickhelp-mode)
)

(use-package lsp-mode
	:ensure t
	:diminish
	:diminish flymake
	:hook((c-mode-common) . lsp)
	:bind(:map c-mode-base-map
			("<f5>" . lsp-find-definition)
			("<f6>" . lsp-find-references)
			("<f7>" . lsp-find-declaration)
)
	:custom(lsp-prefer-flymake nil)
)

(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))

(use-package lsp-ui
	:ensure t
	:after lsp-mode
	:bind(:map lsp-ui-mode-map
		("C-f" . lsp-ui-imenu)
		([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ([remap xref-find-references] . lsp-ui-peek-find-references)
	)
	:custom
	(lsp-ui-doc-enable t)
	(lsp-ui-doc-header t)
	(lsp-ui-doc-include-signature t)
	(lsp-ui-doc-position 'top)
	(lsp-ui-doc-border (face-foreground 'default))
	(lsp-ui-sideline-enable nil)
	(lsp-ui-sideline-ignore-duplicate t)
	(lsp-ui-sideline-show-code-actions nil)
	:diminish
	:commands lsp-ui-mode
)

(use-package latex
	:no-require t
	:hook(latex-mode . flyspell-mode)
)

(use-package latex-extra
	:ensure t
	:after latex
)

(use-package python
	:mode("\\.py\\'" . python-mode)
)

(use-package jedi
	:ensure t
	:commands(company-jedi)
)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

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

(use-package virtualenvwrapper
	:ensure t
	:defer t
)

(setq c-basic-offset 4)

(use-package function-args
	:ensure t
	:diminish
	:init(fa-config-default)
	:bind(:map c-mode-base-map
		("M-s" . moo-jump-directory)
)
)

(defun luca/c-debug (directory)
	"Sets up debugging environment for c"
	(interactive "sFile Path:")
	(gdb (format "gdb -i=mi %s" directory ))
	(gbd-many-windows)
)



(use-package gud
	:no-require t
	:commands luca/c-debug
	:bind(:map c-mode-base-map
		("C-<f5>" . gud-break)
		("C-<f6>" . gud-step)
		("C-<f7>" . gud-next)
)
)

(defun create-java-project (project-name group-id)
	"Creates a java project with the necessary directory structure"
	(interactive "sProject Name:\nsGroup ID:")
	(shell-command (format "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-simple -DarchetypeVersion=1.4 -DinteractiveMode=false" group-id project-name))
)

(use-package jdee
	:ensure t
	:defer t
	:custom(jdee-server-dir "~/.emacs.d/jdee-jar/")
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
	:after css-mode
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
	:after web-mode
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
	:diminish
	:hook(prog-mode . yas-minor-mode)
	(org-mode . yas-minor-mode)
	:bind*("C-~" . yas-insert-snippet)
	:config
	(yas-reload-all)
	(use-package yasnippet-snippets
		:ensure t
		:after yasnippet
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
	:bind*("M-o" . ace-window)
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

(use-package senator
	:no-require t
	:bind*("<M-down>" . senator-transpose-tags-down)
	("<M-up>" . senator-transpose-tags-up)
)

(use-package tramp :defer t)
(use-package with-editor :defer t)
(use-package org-agenda :defer t)
(use-package speedbar :defer t)
(use-package gud :defer t)
(use-package all-the-icons :defer t)
(use-package realgud :defer t)
(use-package smartscan :defer t)
(use-package ivy :diminish :defer t)
(use-package vterm :defer t)

(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)
