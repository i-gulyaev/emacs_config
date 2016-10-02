

(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . nil)
               (c-basic-offset . 4)))


(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (setq show-trailing-whitespaces t)
  (subword-mode))

(add-hook 'c-mode-common-hook 'my-c++-mode-hook)

;; Find other file by Ctrl-c t
(setq cc-other-file-alist '(
			    ("\\.cpp$" (".h" ".hpp"))
			    ("\\.c$" (".h"))
			    ("\\.h$" (".cpp" ".cc" ".c"))
			    ("\\.hpp$" (".cpp"))
			    ("\\.hxx$" (".cxx")) ))

(global-set-key "\C-ct" 'ff-find-other-file)

;; Enable which-func-mode. Show current function in status bar
(which-func-mode t)

;; Prog modes
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.c$" . c++-mode)
                ("\\.py2" . python-mode)
                ("\\.py3" . python-mode))
              auto-mode-alist))

;;;###autoload
(defun cpp-check ()
 "Run cpp-check on current file the buffer is visiting."
 (interactive)
 (let (compile-command)
   (compile
    (concat "cppcheck --enable=all --template='{file}:{line}: {severity}: {message}' " (buffer-file-name)))))

(provide 'prog-mode)
