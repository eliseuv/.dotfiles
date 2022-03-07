;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Eliseu Venites Filho"
      user-mail-address "eliseuv816@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 12)
      doom-variable-pitch-font (font-spec :family "Alegreya" :size 13)
      doom-big-font (font-spec :family "Fira Code" :size 24))
;; change certain keywords to symbols, such as lambda
(setq global-prettify-symbols-mode t)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-outrun-electric)

;; Allow bold and italic text
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  ;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory (file-truename "~/documents/org/")
        org-agenda-files (file-truename "~/documents/org/agenda.org")
        org-capture-journal-file (file-truename "~/documents/org/journal.org")
        org-hide-emphasis-markers t)
  ;; Default folding
  (setq org-startup-folded 'content)
  ;; Default LaTeX packages
  (setq org-latex-packages-alist '(("" "amsmath" t)
                                   ("" "amsthm" t)
                                   ("" "mathtools" t)
                                   ("" "braket" t)
                                   ("dvipsnames" "xcolor" t)
                                   ("" "cancel" t))
        )
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Extra config from https://tecosaur.github.io/emacs-config/config.html

;; Undos
(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

;; Switching windows
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Ask which buffer to open when window is split
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))
;; With previw enabled
(setq +ivy-buffer-preview t)

(add-to-list 'Info-directory-list "~/.doom.d/info")

;; Projectile
(setq projectile-project-search-path '("~/programs"))

;; vterm
(after! vterm
  (set-popup-rule! "*doom:vterm-popup" :size 0.3 :vslot -4 :select t :quit nil :ttl 0 :side 'right)
  )

;; org-roam
(use-package! org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/documents/org-roam"))
  (org-roam-complete-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      (file "~/documents/org-roam/templates/default.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n#+DATE: %U\n#+FILETAGS: \n\n")
      :unnarrowed t)
     ("b" "bibliography" plain
      (file "~/documents/org-roam/templates/bibliography.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n#+DATE: %U\n#+FILETAGS: biblio \n\n")
      :unnarrowed t)))
  :bind (("C-c n g" . org-roam-ui-mode))
  :config
  (org-roam-setup)
  (org-id-update-id-locations)
  )

;; org-roam-ui
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


;; Latex
                                        ; Set default pdf viewer
(setq +latex-viewers '(zathura))
(with-eval-after-load 'tex
  (add-to-list 'TeX-view-program-selection
               '(output-pdf "Zathura"))
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))
                                        ; Use LaTeX preview pane mode
(require 'latex-preview-pane)
(latex-preview-pane-enable)
                                        ;(map!
                                        ; :map LaTeX-mode-map
                                        ; :localleader
                                        ; :desc "View" "v" #'TeX-view)
                                        ; Use TAB for cdlatex
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

;; LSP
(require 'lsp-mode)
(add-hook 'python-mode-hook 'lsp)
(setq lsp-eldoc-enable-hover 't
      lsp-eldoc-render-all 't)
(setq lsp-ui-doc-mode 't
      lsp-ui-doc-enable 't
      lsp-ui-doc-delay 0.2
      lsp-ui-doc-use-webkit 't
      lsp-ui-doc-include-signature 't
      lsp-ui-doc-header 't
      lsp-ui-doc-include-signature 't
      lsp-log-io 't)
                                        ;(setq lsp-ui-sideline-mode 't)
                                        ;(setq lsp-ui-imenu-buffer-mode 't
                                        ;      lsp-ui-imenu-enable 't)

;; Flycheck
(setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled)
      flycheck-idle-change-delay 0.2)

;; Anaconda
(require 'conda)
(custom-set-variables
 '(conda-anaconda-home "/opt/anaconda"))
(setq conda-env-home-directory (file-truename "~/.conda/"))
(add-hook 'conda-postactivate-hook 'python-mode)

;; Julia
                                        ; Do not use built-in package
(setq lsp-julia-package-dir nil)
                                        ; Select julia environment
(setq lsp-julia-default-environment "~/.julia/environments/v1.7")
(after! julia-repl
(julia-repl-set-terminal-backend 'vterm)
(set-popup-rule! "*julia:\*" :side 'right :size 0.3 :ttl 0 :quit nil :select nil)
(setenv "JULIA_NUM_THREADS" "15")
)
