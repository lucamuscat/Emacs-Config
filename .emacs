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
 '(LaTeX-command "latex -shell-escape -interaction nonstopmode")
 '(ansi-color-names-vector
   ["#1D252C" "#D95468" "#8BD49C" "#EBBF83" "#5EC4FF" "#E27E8D" "#70E1E8" "#A0B3C5"])
 '(browse-url-chrome-program "chrome")
 '(browse-url-chromium-program "chrome")
 '(c-default-style
   (quote
	((c-mode . "linux")
	 (java-mode . "java")
	 (awk-mode . "awk")
	 (other . "gnu"))))
 '(comany-idle-delay 0.3 t)
 '(company-frontends
   (quote
	(company-pseudo-tooltip-frontend company-echo-metadata-frontend)))
 '(company-idle-delay 0.3)
 '(company-lsp-cache-candidates (quote auto) nil nil "Customized with use-package company-lsp")
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
	("1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613" "2878517f049b28342d7a360fd3f4b227086c4be8f8409f32e0f234d129cee925" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
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
 '(fci-rule-color "#56697A")
 '(flycheck-checkers
   (quote
	(lsp-ui ada-gnat asciidoctor asciidoc bazel-buildifier c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3 erlang eruby-erubis eruby-ruumba fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-staticcheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json json-jq jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc protobuf-prototool pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform terraform-tflint tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby yaml-yamllint clang-analyzer)))
 '(flycheck-disabled-checkers (quote (c/c++-cppcheck)))
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
 '(ivy-initial-inputs-alist nil)
 '(ivy-mode t)
 '(ivy-re-builders-alist (quote ((t . ivy--regex-fuzzy))) t)
 '(ivy-use-virtual-buffers t nil nil "Customized with use-package ivy")
 '(jdee-db-active-breakpoint-face-colors (cons "#10151C" "#5EC4FF"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#10151C" "#8BD49C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#10151C" "#384551"))
 '(jdee-server-dir "~/.emacs.d/jdee-jar/" t)
 '(lsp-clients-csharp-language-server-path
   "C:\\Users\\lucam\\AppData\\Roaming\\.emacs.d\\.cache\\omnisharp\\server\\v1.34.5\\OmniSharp.exe")
 '(lsp-prefer-flymake nil)
 '(lsp-treemacs-sync-mode t)
 '(lsp-ui-doc-border "#A0B3C5" t nil "Customized with use-package lsp-ui")
 '(lsp-ui-doc-enable t t nil "Customized with use-package lsp-ui")
 '(lsp-ui-doc-header nil t nil "Customized with use-package lsp-ui")
 '(lsp-ui-doc-include-signature t t nil "Customized with use-package lsp-ui")
 '(lsp-ui-doc-position (quote top) t nil "Customized with use-package lsp-ui")
 '(lsp-ui-sideline-enable nil t nil "Customized with use-package lsp-ui")
 '(lsp-ui-sideline-ignore-duplicate t t nil "Customized with use-package lsp-ui")
 '(lsp-ui-sideline-show-code-actions nil t nil "Customized with use-package lsp-ui")
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "C:\\Program Files\\Git\\cmd\\git.exe")
 '(nrepl-message-colors
   (quote
	("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(objed-cursor-color "#D95468")
 '(org-babel-load-languages (quote ((python . t) (C \.t))))
 '(org-directory "C:\\Users\\lucam\\Dropbox\\Notes and PDFs\\Org_Notes")
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "C:/users/lucam/pictures/orgimages/")
 '(org-latex-image-default-height "8cm")
 '(org-latex-image-default-width "8cm")
 '(org-latex-images-centered t)
 '(org-latex-listings (quote minted) t)
 '(org-latex-minted-options (quote (("frame" "lines") ("linenos" ""))) t)
 '(org-latex-packages-alist (quote (("" "minted"))))
 '(org-latex-pdf-process
   (quote
	("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")) t)
 '(org-latex-title-command nil)
 '(org-latex-toc-command "\\maketitle \\clearpage \\tableofcontents \\clearpage" t)
 '(org-startup-with-inline-images nil)
 '(package-selected-packages
   (quote
	(vterm quelpa-use-package quelpa omnisharp csproj-mode dotnet csharp-mode lsp-treemacs treemacs-lsp treemacs-projectile flycheck-clang-analyzer dap-mode lsp-ui company-lsp org-ref c-eldoc function-args helm-projectile terminal-here cmake-font-lock company-quickhelp ag projectile lsp-mode so-long clean-buffers company-web smart-scan smartscan git-gutter web-mode css-comb ahk-mode helm-occur benchmark-init undo-tree web-beautify zencoding-mode column-enforce virtualenvwrapper auto-virutalenv neotree doom-themes git-gutter+-mode ace-window lusty impatient-mode sr-speedbar blacken org-wc define-word yasnippet-snippets yasnippet-classic-snippets which-key use-package smex pylint ox-twbs magit latex-extra jedi helm-ag flymake fill-column-indicator diminish dashboard auto-yasnippet aggressive-indent ace-mc)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-enable-caching t)
 '(python-shell-interpreter
   "C:/Users/lucam/AppData/Local/Programs/Python/Python37-32/python.exe")
 '(rg-executable "C:ipgrepg.exe")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tab-width 4)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(treemacs-display-in-side-window nil)
 '(treemacs-eldoc-display t)
 '(treemacs-indentation 2)
 '(treemacs-pre-file-insert-predicates nil)
 '(treemacs-show-hidden-files t)
 '(treemacs-width 35)
 '(vc-annotate-background "#1D252C")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
	(cons 20 "#8BD49C")
	(cons 40 "#abcd93")
	(cons 60 "#cbc68b")
	(cons 80 "#EBBF83")
	(cons 100 "#e5ae6f")
	(cons 120 "#df9e5b")
	(cons 140 "#D98E48")
	(cons 160 "#dc885f")
	(cons 180 "#df8376")
	(cons 200 "#E27E8D")
	(cons 220 "#df7080")
	(cons 240 "#dc6274")
	(cons 260 "#D95468")
	(cons 280 "#b05062")
	(cons 300 "#884c5c")
	(cons 320 "#604856")
	(cons 340 "#56697A")
	(cons 360 "#56697A")))
 '(vc-annotate-very-old-color nil)
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
 '(ivy-current-match ((t (:inverse-video t :underline (:color "white" :style wave) :slant normal :weight thin))))
 '(swiper-line-face ((t (:background "gold" :foreground "#10151C"))))
 '(xah-css-class-selector ((t (:foreground "deep sky blue" :weight bold)))))
(put 'magit-diff-edit-hunk-commit 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
