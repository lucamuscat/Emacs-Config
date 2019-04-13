(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(setq inhibit-splash-screen t)

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

(use-package diff-hl
:config(add-hook 'prog-mode-hook 'diff-hl-mode)
)

(set-frame-font "Consolas 12" nil t)

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
:config(setq dashboard-startup-banner "~/.emacs.d/dashboard.png")
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
:init (flyspell-lazy-mode 1)
)

(use-package which-key 
:ensure t
:init (which-key-mode)
)

;; Spell Correct
(setq ispell-program-name "~/.emacs.d/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist`, please note it will be passed   to hunspell CLI as "-d" parameter
(setq ispell-local-dictionary "en_US") 
(setq ispell-local-dictionary-alist
    '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))

(setq org-startup-with-inline-images nil)

(setq org-latex-image-default-width "8cm")
(setq org-latex-image-default-height "8cm")
(setq org-latex-images-centered t)

(use-package org-download 
:ensure t
)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default org-download-heading-lvl nil)

(add-hook 'org-mode-hook (lambda()
(local-set-key (kbd "C-M-y") 'org-download-yank)
(org-toggle-inline-images)
))

(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(rainbow-delimiters-mode)

(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

(with-eval-after-load 'company
    (add-hook 'python-mode-hook 'company-mode))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-to-list 'company-backends 'company-jedi))

(defun python-mode-company-init ()
  (setq-local company-backends '((company-jedi
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-hook 'python-mode-hook 'python-mode-company-init))
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
