(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(custom-set-variables
 '(case-fold-search t)
 '(column-number-mode t)
 '(display-time-mode t)
 '(font-use-system-font t)
 '(global-font-lock-mode t)
 '(menu-bar-mode nil)
 '(scalable-fonts-allowed t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-dialog-box nil))

;;Enable line numbering mode
(global-linum-mode 1)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Fix for delete key "problem"
(normal-erase-is-backspace-mode 1)

;; Spaces instead of tabs 
(setq-default indent-tabs-mode nil)

;;disable autosaving
(auto-save-mode nil)

(setq use-package-always-ensure t)

;; (use-package uniquify
;;   :config (setq uniquify-buffer-name-style 'forward))

(use-package ido
  :init
  (add-hook 'ido-setup-hook 
	    (lambda () 
	      (define-key ido-completion-map [tab] 'ido-complete)))
  (ido-mode)
  :bind ("C-x C-d" . ido-dired))

(use-package color-theme
  :init
  (color-theme-initialize)
  (color-theme-bharadwaj))

(use-package dired-details+
  :init
  (setq dired-details-hidden-string ""))

(use-package midnight)

(use-package yasnippet
  :config (use-package dropdown-list)
  :init
  (setq yas/prompt-functions
	'(yas/dropdown-prompt
	  yas/ido-prompt
	  yas/completing-prompt))
  (yas-global-mode))


(use-package xcscope
  :bind (("C-c d" . cscope-find-this-symbol)
	 ("C-c g" . cscope-find-global-definition)
	 ("C-c r" . cscope-find-functions-calling-this-function)
	 ("C-c v" . cscope-find-called-functions)
	 ("C-c f" . cscope-find-this-file)
	 ("C-c i" . cscope-find-files-including-file)
	 ("C-c x" . cscope-find-this-text-string)))

(use-package ess-site
  :disabled t
  :commands R)

(use-package markdown-mode)

(use-package prog-mode
  :load-path "lisp/"
  :ensure nil)
