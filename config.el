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

(use-package neotree
 :ensure t
	:diminish
	:commands neotree-toggle neotree-refresh neotree
	:bind(:map prog-mode-map
	("C-<tab>" . neotree-toggle)
)
)

(setq-default frame-title-format '("Lucinda?"))

(set-frame-font "Consolas 14" nil t)

(use-package sr-speedbar
	:defer t
	:config(with-eval-after-load "speedbar"
		(autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
	)
)
;; fix so speedbar is in same window

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
