(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("elpa"  . "https://elpa.gnu.org/packages/")
			 ))
(package-initialize)
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ded6c5" "#f71010" "#028902" "#ef8300" "#1111ff" "#a020f0" "#358d8d" "#262626"])
 '(browse-url-chrome-program "chrome")
 '(browse-url-chromium-program "chrome")
 '(comany-idle-delay 0.3 t)
 '(company-frontends
   (quote
    (company-pseudo-tooltip-frontend company-echo-metadata-frontend)))
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 1)
 '(company-quickhelp-color-background "#D0D0D0")
 '(company-quickhelp-color-foreground "#494B53")
 '(company-quickhelp-mode t)
 '(company-require-match nil)
 '(company-tooltip-align-annotation t t)
 '(compilation-message-face (quote default))
 '(css-fontify-colors t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (doom-city-lights)))
 '(custom-safe-themes
   (quote
    ("d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(darkroom-margin-increment 0.05)
 '(darkroom-margins 0.05)
 '(darkroom-text-scale-increase 2)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#f6f0e1")
 '(flycheck-python-mypy-executable
   "C:\\Users\\lucam\\AppData\\Local\\Programs\\Python\\Python37-32\\Scripts\\mypy.exe")
 '(gnus-logo-colors (quote ("#259ea2" "#adadad")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(ispell-local-dictionary "en_US")
 '(ispell-local-dictionary-alist
   (quote
    (("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil
      ("-d" "en_US")
      nil utf-8))))
 '(ispell-program-name "~/.emacs.d/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
 '(ivy-count-format "(%d/%d) " nil nil "Customized with use-package ivy")
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t nil nil "Customized with use-package ivy")
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(jdee-server-dir "~/.emacs.d/jdee-jar")
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "C:\\Program Files\\Git\\cmd\\git.exe")
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(objed-cursor-color "#ff665c")
 '(org-directory "C:\\Users\\lucam\\Dropbox\\Notes and PDFs\\Org_Notes")
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "C:/users/lucam/pictures/orgimages/")
 '(org-latex-image-default-height "8cm" t)
 '(org-latex-image-default-width "8cm" t)
 '(org-latex-images-centered t t)
 '(org-latex-pdf-process
   (quote
    ("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")) t)
 '(org-latex-toc-command "\\tableofcontents \\clearpage" t)
 '(org-startup-with-inline-images nil)
 '(package-selected-packages
   (quote
    (autothemer lsp-java lsp-mode git-commit company-irony company-irony-c-headers irony clang-format so-long clean-buffers company-web smart-scan smartscan git-gutter web-mode css-comb ahk-mode helm-occur benchmark-init undo-tree web-beautify zencoding-mode column-enforce virtualenvwrapper auto-virutalenv neotree doom-themes eglot git-gutter+-mode ace-window lusty smart-compile impatient-mode sr-speedbar blacken org-wc define-word yasnippet-snippets yasnippet-classic-snippets which-key use-package smex realgud pylint pyimport powerline ox-twbs magit latex-extra jedi helm-projectile helm-ag flyspell-lazy flymake fill-column-indicator diminish dashboard dap-mode beacon auto-yasnippet anzu aggressive-indent ace-mc)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-enable-caching t)
 '(python-shell-interpreter
   "C:/Users/lucam/AppData/Local/Programs/Python/Python37-32/python.exe" t)
 '(rg-executable "C:ipgrepg.exe")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#f6f0e1")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d81212")
     (40 . "#f71010")
     (60 . "#6a621b")
     (80 . "#958323")
     (100 . "#ef8300")
     (120 . "#9ca30b")
     (140 . "#008b45")
     (160 . "#077707")
     (180 . "#028902")
     (200 . "#1c9e28")
     (220 . "#3cb368")
     (240 . "#0d7b72")
     (260 . "#358d8d")
     (280 . "#286060")
     (300 . "#2020cc")
     (320 . "#1111ff")
     (340 . "#2c53ca")
     (360 . "#a020f0"))))
 '(vc-annotate-very-old-color "#a020f0")
 '(w32-pipe-read-delay 50 t)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-snippet-dirs
   (quote
    ("c:/Users/lucam/AppData/Roaming/.emacs.d/snippets" yasnippet-snippets-dir yasnippet-classic-snippets-dir "c:/Users/lucam/AppData/Roaming/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-property ((t (:foreground "deep sky blue"))))
 '(css-selector ((t (:foreground "brown" :weight ultra-bold))))
 '(ivy-current-match ((t (:background "firebrick"))))
 '(swiper-line-face ((t (:background "gold" :foreground "#10151C"))))
 '(xah-css-class-selector ((t (:foreground "deep sky blue" :weight bold)))))
(put 'magit-diff-edit-hunk-commit 'disabled nil)
(put 'narrow-to-region 'disabled nil)
