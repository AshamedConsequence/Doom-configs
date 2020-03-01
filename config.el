;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Maxime Morize"
			user-mail-address "maxime.morize@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Inconsolata" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;
(def-package! org-super-agenda
	:after org-agenda
	:init
	(setq org-super-agenda-groups '((:name "Today"
																				 :time-grid t
																				 :scheduled today)
																	(:name "Due today"
																				 :deadline today)
																	(:name "Important"
																					:priority "A")
																	(:name "Overdue"
																					:deadline past)
																	(:name "Due soon"
																					:deadline future)
																	(:name "Big Outcomes"
																				 :tag "bo")))
	:config
	(org-super-agenda-mode))

(add-to-list 'load-path "~/undo-tree/")
(global-undo-tree-mode)

(map! :leader
			:prefix "o"
			:desc "Undo Tree" "u" #'undo-tree-visualize)

(map! :leader
			:prefix "o"
			:desc "Weather" "w" #'wttrin)
(setq wttrin-default-cities '("Katy" "Paris" "Houston"))

(require 'origami)
(global-origami-mode)

(setq-default indent-tabs-mode t)

(latex-preview-pane-enable)
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
	'(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
	'(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
	'(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
	'(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
	'(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
	'(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))
