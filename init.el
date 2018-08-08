(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; ================================================================================
;; ========== PACKAGE INITIALISATION ==============================================
;; ================================================================================

(setq package-list '(
		     use-package
		     exec-path-from-shell
		     solarized-theme
		     smart-mode-line-powerline-theme
		     smart-mode-line
		     evil
		     evil-commentary
		     linum-relative
		     dashboard
		     ag
		     helm-ag
		     projectile
		     helm-projectile
		     helm
		     projectile
		     helm-projectile
		     ace-window
		     avy
		     all-the-icons
		     neotree
		     company
		     magit
		     elpy
		     js2-mode
		     tide
		     web-mode
		     jsx-mode
		     typescript-mode
		     lsp-mode
		     ))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


;; ================================================================================
;; ========== SYSTEM LEVEL CONFIGS ================================================
;; ================================================================================

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
)

;;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/:/home/jerry/.nvm/versions/node/v8.9.4/bin/"))
;;(setq exec-path (append exec-path '("/usr/local/bin/:/home/jerry/.nvm/versions/node/v8.9.4/bin/")))



;; ========== System LEVEL CONFIGS (END) ==========================================



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
(setq sml/no-confirm-load-theme t)

;; ========== solarized-theme =====================================================
;; (unless (package-installed-p 'solarized-theme)
;;   (package-refresh-contents)
;;   (package-install 'solarized-theme))

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

;; (unless (package-installed-p 'smart-mode-line)
;;   (package-refresh-contents)
;;   (package-install 'smart-mode-line)
;;   (package-install 'smart-mode-line-powerline-theme))

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
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
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

(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 20)
  (bookmarks . 5)
  (projects . 5)
  (agenda . 5)
  (registers . 5))))

;; ========== helm/projectile ====================================================
(use-package helm
  :init
  (global-set-key (kbd "C-c h") 'helm-mini)
  ;; :config
  ;; (use-package helm-config
  ;;   :ensure t)
  )

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
(use-package ace-window
  :init
  (global-set-key (kbd "M-o") 'ace-window))

(use-package avy
  :init
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-w") 'ace-window))

;; (use-package expand-region
;;   :ensure t
;;   :init
;;   (global-set-key (kbd "C-=") 'er/expand-region))

;; used by neotree
(use-package all-the-icons
  :init
  (all-the-icons-install-fonts t))

(use-package neotree
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle))


(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t))


;; ========== PLUGINS (END) =======================================================


;; ================================================================================                              
;; ========== PROGRAMMING STUFF ===================================================
;; ================================================================================



;; ========== language server =====================================================
(use-package lsp-mode
  :config
 (add-hook 'lsp-mode-hook 'lsp-ui-mode))


;; ========== python ==============================================================
(use-package elpy
  :init
  (elpy-enable))


;; ========== JavaScript ==========================================================
(use-package tide
;;  :ensure t
  :config
  ;; set node executable
  (setq tide-node-executable "/home/jerry/.nvm/versions/node/v8.9.4/bin")
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))
  ;; :after (typescript-mode company flycheck)
  ;; :hook ((typescript-mode . tide-setup)
  ;;        (typescript-mode . tide-hl-identifier-mode)
  ;;        (before-save . tide-format-before-save)))


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$\\'" . web-mode))
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (string-equal "tsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))
  ;; for better jsx syntax-highlighting in web-mode
  ;; - courtesy of Patrick @halbtuerke
  (defadvice web-mode-highlight-part (around tweak-jsx activate)
    (if (equal web-mode-content-type "jsx")
	(let ((web-mode-enable-part-face nil))
	ad-do-it)
        ad-do-it))

  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode))
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  ;; configure javascript-tide checker to run after your default javascript checker
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(use-package jsx-mode
  :init
  (setq js-indent-level 2)
  (setq js2-pretty-multiline-declarations nil)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (string-equal "jsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  ;; configure jsx-tide checker to run after your default jsx checker
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))


;; ========== ROGRAMMING STUFF (END) ==============================================                            


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jsx-mode js2-mode web-mode tide elpy company use-package solarized-theme smart-mode-line-powerline-theme neotree linum-relative helm-projectile helm-ag exec-path-from-shell evil-commentary dashboard all-the-icons ag ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
