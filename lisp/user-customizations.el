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
(blink-cursor-mode 0)

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
(add-hook 'cider-mode-hook 'turn-on-eldoc-mode)

;hide the *nrepl-connection* and *nrepl-server* buffers
(setq nrepl-hide-special-buffers t)

;disable auto-selection of the error buffer 
(setq cider-auto-select-error-buffer nil)

;use GNU ls
(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-listing-switches "-aBhl --group-directories-first")

;save repl history to file
(setq cider-repl-history-file "~/.repl-history")

;pprint in the repl by default
(setq cider-repl-use-pretty-printing t)
(setq cider-pprint-fn "clojure.pprint/pprint")

;; company mode
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;use ido-mode, a must-have for quick emacs navigation
;from http://emacswiki.org/emacs/InteractivelyDoThings
;more about it: http://www.masteringemacs.org/article/introduction-to-ido-mode
(require 'ido)
(ido-mode t)

;smex brings the power of ido mode to your M-x mini-buffer, another way to supercharge your emacs navigation
;from https://github.com/nonsequitur/smex
(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;let's make the matching paren even more noticable
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;always show test report after running
(setq cider-test-show-report-on-success t)
