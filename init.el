(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(frame-background-mode (quote dark))
 '(haskell-check-command "hlint")
 '(haskell-mode-hook
   (quote
    (haskell-indent-mode highlight-uses-mode imenu-add-menubar-index interactive-haskell-mode turn-on-haskell-indentation turn-on-haskell-doc-mode)))
 '(haskell-stylish-on-save t)
 '(js2-strict-missing-semi-warning nil)
 '(linum-relative-current-symbol "")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (lsp-mode json-mode web-mode expand-region company-tern helm-ag ag ace-window avy solarized-theme smart-mode-line-powerline-theme smart-mode-line xref-js2 js2-refactor js2-mode evil-commentary helm-projectile helm use-package linum-relative dashboard flycheck-haskell flycheck projectile org magit evil-leader))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; ================================================================================
;; ========== SYSTEM LEVEL CONFIGS ================================================
;; ================================================================================

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/"))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; ; Load configuration modules
;; (load-user-file "evil.el")

; Configure evil mode
; Use C-u for scrolling up
(setq evil-want-C-u-scroll t)

; Use evil mode
(use-package evil
  :init
  (evil-mode t)
)

;; (load-user-file "appearance.el")

; Bind escape to quit minibuffers
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
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

;; ========== SYSTEM LEVEL CONFIGS (END) ==========================================


;; Enable transient mark mode
(transient-mark-mode 1)


;; ================================================================================
;; ========== PLUGINS =============================================================
;; ================================================================================

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;;(setq flycheck-executable-find
;;      (lambda (cmd) (direnv-update-environment default-directory)(executable-find cmd)))
;;(global-flycheck-mode)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 20)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5))))

(use-package evil-commentary
  :init
  (evil-commentary-mode))

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-.") nil))

(use-package linum-relative
  :init
  (linum-relative-toggle)
  (global-linum-mode 1)
  (setq linum-relative-backend 'display-line-numbers-mode))

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

(use-package avy
  :init
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "s-w") 'ace-window))

(use-package ace-window
  :init
  (global-set-key (kbd "M-o") 'ace-window))

(use-package expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))

;; ========== PLUGINS (END) =======================================================




;; ================================================================================
;; ========== PROGRAMMING LANGUAGES ===============================================
;; ================================================================================


;; ========== JavaScript ==========================================================

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

  ;; for better jsx syntax-highlighting in web-mode
  ;; - courtesy of Patrick @halbtuerke
  (defadvice web-mode-highlight-part (around tweak-jsx activate)
    (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
      ad-do-it)
      ad-do-it)))


(use-package js2-mode
  :init
  (setq js-indent-level 2)
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq js2-pretty-multiline-declarations nil)
  ;; better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))


(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)




;; ========== Haskell =============================================================

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(use-package haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

  ;; hslint on the command line only likes this indentation mode;
  ;; alternatives commented out below.
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

  ;; Ignore compiled Haskell files in filename completions
  (add-to-list 'completion-ignored-extensions ".hi"))

(defun flymake-haskell-init ()
  "When flymake triggers, generates a tempfile containing the
  contents of the current buffer, runs `hslint` on it, and
  deletes file. Put this file path (and run `chmod a+x hslint`)
  to enable hslint: https://gist.github.com/1241073"
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "hslint" (list local-file))))

(defun flymake-haskell-enable ()
  "Enables flymake-mode for haskell, and sets <C-c d> as command
  to show current error."
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name))
    (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))

;; Forces flymake to underline bad lines, instead of fully
;; highlighting them; remove this if you prefer full highlighting.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

;; (load-user-file "hs-lint.el")
;; (defun my-haskell-mode-hook ()
;;     (local-set-key "\C-cl" 'hs-lint))
;; (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)



(add-to-list 'load-path "/Users/jmooyman/repos/public/lsp-haskell")
(add-to-list 'load-path "/Users/jmooyman/repos/public/lsp-mode")
(add-to-list 'load-path "/Users/jmooyman/repos/public/lsp-ui")
(require 'lsp-ui)
(require 'lsp-haskell)

;; (lsp-define-stdio-client
;;  ;; This can be a symbol of your choosing. It will be used as a the
;;  ;; prefix for a dynamically generated function "-enable"; in this
;;  ;; case: lsp-prog-major-mode-enable
;;  lsp-prog-major-mode
;;  "language-id"
;;  ;; This will be used to report a project's root directory to the LSP
;;  ;; server.
;;  (lambda () default-directory)
;;  ;; This is the command to start the LSP server. It may either be a
;;  ;; string containing the path of the command, or a list wherein the
;;  ;; car is a string containing the path of the command, and the cdr
;;  ;; are arguments to that command.
;;  '("/my/lsp/server" "and" "args"))

;; ;; Here we'll add the function that was dynamically generated by the
;; ;; call to lsp-define-stdio-client to the major-mode hook of the
;; ;; language we want to run it under.
;; ;;
;; ;; This function will turn lsp-mode on and call the command given to
;; ;; start the LSP server.
;; (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)


;; (require 'lsp-ui)
;; (require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
(add-hook 'haskell-mode-hook 'flycheck-mode)




;; ========== Checkers & Linters ==================================================
(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
(append flycheck-disabled-checkers '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
(append flycheck-disabled-checkers '(json-jsonlist)))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
(let* ((root (locate-dominating-file
	    (or (buffer-file-name) default-directory)
	    "node_modules"))
	(eslint (and root
		    (expand-file-name "node_modules/eslint/bin/eslint.js"
				    root))))
(when (and eslint (file-executable-p eslint))
    (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)



;; ========== PROGRAMMING LANGUAGES (END) =========================================



;; ================================================================================
;; ========== LOOK AND FEEL =======================================================
;; ================================================================================

;; powerline these (c/o smart-mode-line)
(use-package smart-mode-line
  :init
  ;; These two lines are just examples
  (setq powerline-arrow-shape 'curve)
  (setq powerline-default-separator-dir '(right . left))
  ;; These two lines you really need.
  (setq sml/theme 'respectful)
  (sml/setup))

(set-face-attribute 'default nil :height 120)


;; configure the appearance

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
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)



;; window customisation

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark)))

(add-to-list 'custom-theme-load-path "/Users/jmooyman/repos/public/blackboard-theme/")
(add-to-list 'custom-theme-load-path "/Users/jmooyman/repos/public/emacs-color-theme-solarized/")
(load-theme 'solarized t)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

; Set cursor colors depending on mode
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
)

;; ========== LOOK AND FEEL (END) =================================================


;;; (provide 'init)
;;; init.el ends here
