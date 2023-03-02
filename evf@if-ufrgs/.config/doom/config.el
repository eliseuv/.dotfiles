;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Eliseu Venites Filho"
      user-mail-address "evf@if-ufrgs")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

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

;; Better defaults
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

(global-subword-mode t)                           ; Recognize uppercase letters as word boundaries (useful for CamelCase naming)

;; Make popups open on the right
(set-popup-rules!
  '(("^ \\*" :slot -1)
    ("^\\*" :select t)
    ("^\\*Completions" :slot -1 :ttl 0)
    ("^\\*\\(?:scratch\\|Messages\\)" :ttl t)
    ("^\\*Help" :slot -1 :size 0.2 :select t)
    ("^\\*doom:" :size 0.3 :select t :modeline t :quit t :ttl t :side right)))

;; Enable vertical and horizontal splitting
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; Ask which buffer (with preview) to open when window is split:
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

;; Remove window decoration
(setq default-frame-alist '((undecorated . t)))

;; Default mode
(setq-default major-mode 'org-mode)

;; vterm
(use-package! vterm
  :ensure t)
(after! vterm
  (set-popup-rule! "*doom:vterm-popup:main" :size 0.3 :vslot -4 :select t :quit nil :ttl 0 :side 'right))

;; Julia

;; Do not use built-in package
(setq lsp-julia-package-dir nil)
;; Select Julia environment
(setq lsp-julia-default-environment "~/.julia/environments/v1.8")

;; Julia REPL
(after! julia-repl
  ;; Use vterm
  (julia-repl-set-terminal-backend 'vterm)
  ;; Open REPL at the right side
  (set-popup-rule! "*julia:\*" :side 'right :size 0.3 :ttl 0 :quit nil :select nil)
  ;; Set environment variables
  (setenv "JULIA_NUM_THREADS" "7"))

;; Python

;; (add-hook 'python-mode-hook 'lsp)

;; Anaconda

(require 'conda)
;; (custom-set-variables
;;  '(conda-anaconda-home "/opt/miniconda3/"))
(setq
 conda-anaconda-home (expand-file-name "~/anaconda3/")
 conda-env-home-directory (expand-file-name "~/anaconda3/")
 conda-env-subdirectory "envs")
;; (add-hook 'conda-postactivate-hook 'python-mode)
