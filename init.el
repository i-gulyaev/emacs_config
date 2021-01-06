(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(column-number-mode t)
 '(display-time-mode t)
 '(font-use-system-font t)
 '(global-font-lock-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets dropdown-list dired-details+ php-mode yasnippet use-package markdown-mode)))
 '(scalable-fonts-allowed t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-dialog-box nil))

;;Enable line numbering mode
(global-linum-mode 1)

;; use y/n instead of yes/no
(fset 'yes-or-no-p #'y-or-n-p)

;; Fix for delete key "problem"
(normal-erase-is-backspace-mode 1)

;; Spaces instead of tabs 
(setq-default indent-tabs-mode nil)

;;disable autosaving
(auto-save-mode nil)

(setq-default truncate-lines 300)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq use-package-always-ensure t)

(use-package uniquify
  :ensure nil
  :init (setq uniquify-buffer-name-style 'forward))

(use-package ido
  :init
  (add-hook 'ido-setup-hook 
	    (lambda () 
	      (define-key ido-completion-map [tab] 'ido-complete)))
  (ido-mode)
  :bind ("C-x C-d" . ido-dired))

(use-package midnight)

(use-package yasnippet
  :init
  (setq yas/prompt-functions
	'(yas/dropdown-prompt
	  yas/ido-prompt
	  yas/completing-prompt))
  (yas-global-mode))

(use-package ess-site
  :disabled t
  :commands R)

(use-package markdown-mode)

(use-package php-mode
  :init
  (add-hook 'php-mode-hook 'php-enable-default-coding-style))

;; various settings for programming
(load-file "~/.emacs.d/lisp/setup-prog-mode.el")
(load-file "~/.emacs.d/lisp/ack.el")

(load-theme 'wombat)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
