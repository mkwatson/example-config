;turn off emacs alarms (those annoying beeps)
(setq ring-bell-function 'ignore)

;expand-region functionality is really great for lisp/clojure editing
;from https://github.com/magnars/expand-region.el
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;sets the auto-save directory to be other than project directories, so you aren't inundated with tons of backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;adds color matching for open and closed parenthesis
;from https://github.com/Fanael/rainbow-delimiters
(require-package 'rainbow-delimiters)
;turns on this for default with clojure files
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;be kind to your eyes, solarize! hey, that rhymes!
;from https://github.com/bbatsov/solarized-emacs
(require-package 'solarized-theme)
(require 'solarized-dark-theme)
(provide 'solarized-theme)

;use I-Buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;shortcut to launch a shell
(global-set-key (kbd "C-x C-m") 'shell)

;turn off the emacs toolbar; we're coders, after all. when do we use a mouse?
(tool-bar-mode -1)

;turn off the scroll bars
(scroll-bar-mode -1)

;;turn off the cursor blinking -- personally i find it distracting
;(blink-cursor-mode 0)

;turn off text wrapping in the middle of a word
(global-visual-line-mode 1)

;;ORG MODE
;;org mode is a great emacs feature for organization notes, outlines, and more. plenty of docs online about it
(require 'org)
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Font size
(define-key global-map (kbd "s-+") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)

;see: http://www.emacswiki.org/emacs/EmacsForMacOS#toc26
(when (eq system-type 'darwin) ;; mac specific settings
  ;(setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'super)
  ;(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
)

;use eldoc to display fun arguments in minibuffer
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'turn-on-eldoc-mode)

;use GNU ls
(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-listing-switches "-aBhl --group-directories-first")

;save repl history to file
(setq cider-repl-history-file "~/.repl-history")

;pprint in the repl by default
(setq cider-repl-use-pretty-printing t)