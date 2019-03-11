(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode)

(require 'flyspell-lazy)
(flyspell-lazy-mode 1)

(setq flycheck-check-syntax-automatically '(save mode-enable))
;; the default value was '(save idle-change new-line mode-enabled)

(setq display-time-24hr-format t)
(setq display-time-format "%d %B %Y - %H:%M")
(display-time-mode 1)

(setq org-startup-with-inline-images nil)

(setq org-latex-image-default-width "8cm")
(setq org-latex-image-default-height "8cm")
(setq org-latex-images-centered t)

(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default org-download-heading-lvl nil)

(add-hook 'org-mode-hook (lambda()
(local-set-key (kbd "C-M-y") 'org-download-yank)
(org-toggle-inline-images)
))

(require 'darkroom)
(add-hook 'org-mode-hook (lambda ()
(darkroom-tentative-mode)
))

(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(global-visual-line-mode 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(tool-bar-mode -1)

(require 'which-key)
(which-key-mode)

(require 'dashboard)
(setq dashboard-startup-banner "C:/users/lucam/pictures/download.png")
(setq dashboard-banner-logo-title "Don't do the rain dance if you can't handle the thunder - Ken M")
(setq dashboard-items '((recents  . 3)
                        (bookmarks . 3)
                        (projects . 5)
                        (agenda . 0)
                        (registers . 0)))
(dashboard-setup-startup-hook)

(use-package powerline
:ensure t
:diminish
:init (powerline-center-theme)
)

(setq-default frame-title-format '("Lucinda?"))

(set-frame-font "Consolas 12" nil t)

(global-diff-hl-mode)
;;(diff-hl-flydiff-mode)

(setq inhibit-splash-screen t)

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

(rainbow-delimiters-mode)

(require 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook
	  (lambda ()
	    (company-mode)
	    (local-set-key (kbd "C-c C-<SPC>") 'company-jedi)	    
	    (jedi:setup)
	    (jedi:ac-setup)
	    (flycheck-mode +1)
	    (auto-virtualenvwrapper-activate)
	    (setq python-indent-offset 4)
	    (setq jedi:complete-on-dot t)                 ; optional
	    (setq c-basic-indent 2)
	    (setq tab-width 4)
	    (setq indent-tabs-mode nil)
	    ))
(setq python-shell-interpreter "C:/Users/lucam/AppData/Local/Programs/Python/Python37-32/python.exe")

(defun create-java-project (project-name group-id)
"Creates a java project with the necessary directory structure"
(interactive "sProject Name:\nsGroup ID:")
(shell-command (format "mvn archetype:generate -DgroupId=%s -DartifactId=%s -DarchetypeArtifactId=maven-archetype-simple -DarchetypeVersion=1.4 -DinteractiveMode=false" group-id project-name))
)

(add-hook 'java-mode-hook (lambda()
(local-set-key (kbd "<f1>") 'jdee-debug)
(local-set-key (kbd "<f2>") 'jdee-debug-set-breakpoint)
(local-set-key (kbd "<f3>") 'jdee-debug-step-into)
(local-set-key (kbd "<f4>") 'jdee-debug-cont)
(local-set-key (kbd "<f6>") 'jdee-maven-build)
))

(use-package yasnippet
:ensure t
:config
(use-package yasnippet-snippets :ensure t)
(yas-reload-all)
(yas-global-mode)
)
(use-package auto-yasnippet 
:ensure t		      
)

(use-package ace-window
:bind("M-o" . ace-window)
)

(use-package find-file-in-project
:ensure t
:diminish
:bind("C-x C-M-f" . find-file-in-project)
)

(use-package project-explorer
:ensure t
:diminish
:bind("C-<tab>" . project-explorer-toggle)
)

(use-package multiple-cursors
:ensure t
:diminish
:defer t
:bind
("C->" . mc/mark-next-like-this)
("C-<" . mc/mark-previous-like-this)
)

(use-package ace-mc
:ensure t
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
:defer t			      
:init			      
:bind			      
("M-s" . helm-swoop)		      
("C-x a s" . helm-multi-swoop-all) 
("C-s" . helm-occur)		      
("M-y" . helm-show-kill-ring)      
("C-x C-f" . helm-find-files)      
("C-x r m" . helm-bookmarks)	 
("C-x C-b" . helm-buffers-list)  
)

(use-package ace-jump-mode
:ensure t
:defer t
:diminish
:bind("C-x C-M-s" . ace-jump-mode)
)

(setq-default org-download-image-dir "C:/users/lucam/pictures/orgimages/")

(add-hook 'org-mode-hook (lambda()
(local-set-key (kbd "C-s") 'helm-org-rifle)
(local-set-key (kbd "M-s") 'helm-org-rifle-org-directory)
(local-set-key (kbd "C-M-y") 'org-download-yank)
(local-set-key (kbd "C-<return>") 'ispell-word)
(local-set-key (kbd "C-M-q") 'anzu-replace-at-cursor-thing)
))

(global-set-key (kbd "C-M-g") 'query-replace-regexp)
(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-|") 'comment-box)
(global-set-key (kbd "C-M-|") 'uncomment-region)

;; Spell Correct
(setq ispell-program-name "c:/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist`, please note it will be passed   to hunspell CLI as "-d" parameter
(setq ispell-local-dictionary "en_US") 
(setq ispell-local-dictionary-alist
    '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
