;; Package for ack-grep tool

(require 'compile)
(require 'grep)

(define-compilation-mode ack-grep-mode "Ack"
  "Ack results compilation mode."
  (set (make-local-variable 'truncate-lines) t)
  (set (make-local-variable 'compilation-disable-input) t)
  (let ((smbl  'compilation-ack-nogroup)
        (pttrn '("^\\([^:\n]+?\\):\\([0-9]+\\):\\([0-9]+\\):" 1 2 3)))
    (set (make-local-variable 'compilation-error-regexp-alist) (list smbl))
    (set (make-local-variable 'compilation-error-regexp-alist-alist) (list (cons smbl pttrn))))
  (set (make-local-variable 'compilation-error-face) grep-hit-face))


(setq ack-executable (or (executable-find "ack-grep") (executable-find "ack")))
;;(setq ack-executable (executable-find "ag"))
(setq ack-default-options "--nocolor --nogroup --column --smart-case --cpp ")

(defvar ack-history nil
  "History for the `ack' command.")

(defun ack (command-args)
  (interactive
   (let ((ack-command (concat ack-executable " " ack-default-options)))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args)
                       'ack-grep-mode)))

(provide 'emacs-rc-ack)
