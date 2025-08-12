;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Maple Mono Normal NL NF CN" :size 24 :weight 'semi-light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; ~/.doom.d/config.el

;; 1. Define a function to hold your new banner.
;;    The backslashes (\) in the original art must be escaped (\\).
;; (defun my-custom-rip-banner ()
;;   "A custom banner to display on the Doom dashboard."
;;   (insert
;;    (concat
;;     "\n"
(defun my-weebery-is-always-greater ()
  (let* ((banner '("  .-''-.                      .--.  .-. .--------.                      .-''-."
                   " /      `'''--..              ||  \\/  ||'=====. ||              ..--'''`      \\"
                   "|               '.            || .  . ||  .---' ||            .'               |"
                   "|           ..''` '---.       || |\\/|_||  '===. ||       .---' `''..           |"
                   "|        .``           ''''\\  ||_|\\/|.'       |_||  /''''           ``.        |"
                   "/'..   /`              /    /'|_.'            '._|'\\    \\              `\\   ..'\\"
                   "|   `:'         ___..  \\   /  /                  \\  \\   /  ..___         ':`   |"
                   "'____'__...---'':::::\\  '-' ./                    \\. '-'  \\:::::''---...__'____'"
                   " \\::/\\ \\:::::::::::':  ___/                        \\___  :':::::::::::/ /\\::/"
                   "   \\'| \\ '-:::--'`  .' /              Rest              \\ '.  `'--:::-' / |'/"
                   "   /'|  \\    ....''`__/                in                \\__`''....    /  |'\\"
                   "   \\ |   .   |  .-'`   .------. .------..------. .-. .--.   `'-.  |   .   | /"
                   "    \\/::.'   |  |      ||  _   V   _   ||   _   V  \\/  ||      |  |   '.::\\/"
                   "    \\':'_.---|  |      || | |  |  | |  ||  | |  | .  . ||      |  |---._':'/"
                   "     \\\\      |  |      || | |  |   '|  ||  |'   | |\\/| ||      |  |      //"
                   "     \\\\      |  |      || |' .'|'.   .'||'.   .'|'|\\/| ||      |  |      //"
                   "      \\\\      | |      ||  .'.' '.'.'.'  '.'.'.' '|  | ||      | |      //"
                   "      \\\\      | |      ||.'.'     '.'      '.'       |.||      | |      //"
                   "       \\\\     |'       |_.'                          '._|       '|     //"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(after! dape
        (add-to-list 'dape-configs
                `(debugpy modes (python-mode python-ts-mode)
                        port 5678
                        command "python"
                        command-args ("-m" "debugpy.adapter" "--host" "0.0.0.0" "--port" :autoport)
                        :cwd dape-cwd
                        :program dape-buffer-default
                        :args []
                        :justMyCode nil
                        :console "integratedTerminal"
                        :showReturnValue t
                        :stopOnEntry nil)))

(after! magit
  (setq magit-diff-refine-hunk 'all))
(setq dired-listing-switches "-aBhl  --group-directories-first")

;; Set background opacity to 85% for the current frame
;;
(set-frame-parameter nil 'alpha-background 85)

;; Set background opacity for all future frames
(add-to-list 'default-frame-alist '(alpha-background . 85))
(use-package! nyan-mode
  :config
  (nyan-mode)
  (nyan-start-animation))

(after! nyan-mode
  (setq nyan-wavy-trail t))
