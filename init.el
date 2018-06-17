(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(package-initialize)


(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(package-selected-packages
   (quote
    (all-the-icons neotree expand-region ace-window helm-projectile projectile helm-ag ag helm dashboard linum-relative evil-leader evil-commentary evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ================================================================================
;; ========== SYSTEM LEVEL CONFIGS ================================================
;; ================================================================================

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))



;; ========== SYSTEM LEVEL CONFIGS (END) ==========================================



;; ================================================================================
;; ========== LOOK AND FEEL =======================================================
;; ================================================================================

;; ========== custom settings =====================================================
(set-default 'cursor-type
  'hbar)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(show-paren-mode)
(electric-pair-mode)
(global-hl-line-mode t)
(ido-mode t)
(winner-mode t)
(windmove-default-keybindings)

;; Enable transient mark mode
(transient-mark-mode 1)

;; ========== solarized-theme =====================================================
(unless (package-installed-p 'solarized-theme)
  (package-refresh-contents)
  (package-install 'solarized-theme))

(use-package solarized-theme
  :init
  ;; make the fringe stand out from the background
  (setq solarized-distinct-fringe-background t)

  ;; Don't change the font for some headings and titles
  (setq solarized-use-variable-pitch nil)

  ;; make the modeline high contrast
;  (setq solarized-high-contrast-mode-line t)

  ;; Use less bolding
  (setq solarized-use-less-bold t)

  ;; Use more italics
  (setq solarized-use-more-italic t)

  ;; Use less colors for indicators such as git:gutter, flycheck and similar
  (setq solarized-emphasize-indicators nil)

  ;; Don't change size of org-mode headlines (but keep other size-changes)
  (setq solarized-scale-org-headlines nil)

  ;; Avoid all font-size changes
  (setq solarized-height-minus-1 1.0)
  (setq solarized-height-plus-1 1.0)
  (setq solarized-height-plus-2 1.0)
  (setq solarized-height-plus-3 1.0)
  (setq solarized-height-plus-4 1.0)
  :config
  (load-theme 'solarized-dark t)
)

(unless (package-installed-p 'smart-mode-line)
  (package-refresh-contents)
  (package-install 'smart-mode-line)
  (package-install 'smart-mode-line-powerline-theme))

(use-package smart-mode-line
  :init
  ;; These two lines are just examples
  (setq powerline-arrow-shape 'curve)
  (setq powerline-default-separator-dir '(right . left))
  ;; These two lines you really need.
  (setq sml/theme 'respectful)
  (sml/setup))  
  :config
;  (set-face-attribute 'default nil :height 120)


;; ========== LOOK AND FEEL (END) =================================================



;; ================================================================================
;; ========== PLUGINS =============================================================
;; ================================================================================


;; ========== evil-mode ===========================================================
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil)
  (package-install 'evil-commentary)
  (package-install 'evil-leader)
  (package-install 'linum-relative))

(use-package evil
  :init
  (evil-mode t)
  :config
  ; Use C-u for scrolling up
  (setq evil-want-C-u-scroll t)

  ; Bind escape to quit minibuffers
  (defun minibuffer-keyboard-quit ()
    "Abort recursive edit.  In Delete Selection mode, if the mark is active, just deactivate it;
    then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
    
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (global-set-key [escape] 'evil-exit-emacs-state)

  (use-package evil-commentary
    :init
    (evil-commentary-mode))
    :config
    (with-eval-after-load 'evil-maps
    (define-key evil-normal-state-map (kbd "M-.") nil))

  (use-package linum-relative
    :init
    (linum-relative-toggle)
    (global-linum-mode 1)
    :config
    (setq linum-relative-backend 'display-line-numbers-mode))
  
  ; Set cursor colors depending on mode
  (when (display-graphic-p)
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow)))

) 

;; ========== dashboard ===========================================================
(unless (package-installed-p 'dashboard)
  (package-refresh-contents)
  (package-install 'dashboard))

(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 20)
  (bookmarks . 5)
  (projects . 5)
  (agenda . 5)
  (registers . 5))))

;; ========== helm/projectile ====================================================
(unless (package-installed-p 'helm)
  (package-refresh-contents)
  (package-install 'helm)
;  (package-install 'helm-config)
  (package-install 'ag)
  (package-install 'helm-ag)
  (package-install 'projectile)
  (package-install 'helm-projectile))

(use-package helm
  :init
  (global-set-key (kbd "C-c h") 'helm-mini)
  :config
  (use-package helm-config))
  (use-package projectile
    :init
    (projectile-mode t)
    :bind-keymap
    ("C-c p" . projectile-command-map)
    :config
    (use-package helm-projectile
      :init
      (helm-projectile-on)))



;; ========== avy/ace-window/etc =================================================
(unless (package-installed-p 'ace-window)
  (package-refresh-contents)
  (package-install 'ace-window))

(use-package ace-window
  :init
  (global-set-key (kbd "M-o") 'ace-window))


(unless (package-installed-p 'avy)
  (package-refresh-contents)
  (package-install 'avy))

(use-package avy
  :init
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-w") 'ace-window))


(unless (package-installed-p 'expand-region)
  (package-refresh-contents)
  (package-install 'expand-region))

(use-package expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))


;; used by neotree
;; (use-package all-the-icons)
(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree)
  (package-install 'all-the-icons)
  (all-the-icons-install-fonts t))

(use-package neotree
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle))



;; ========== PLUGINS (END) =======================================================

;; ========== python ==============================================================
(unless (package-installed-p 'elpy)
  (package-refresh-contents)
  (package-install 'elpy))

(use-package elpy
  :init
  (elpy-enable))


;; ================================================================================                              
;; ========== PROGRAMMING STUFF ===================================================
;; ================================================================================




;; ========== ROGRAMMING STUFF (END) ==============================================                            


