(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(load-library "paren")

(add-to-list 'load-path
             "~/.emacs.d/plugins")
(autoload 'company-mode "company" nil t)
(require 'yasnippet-bundle)

(defun my-window-setup-hook ()
  (set-background-color        "black") ; Set emacs bg color 
  (set-foreground-color        "light blue") ;Set emacs foreground color..
  (set-mouse-color "orchid")
  (set-cursor-color "red")
  (my-turn-on-font-lock))
(add-hook 'window-setup-hook 'my-window-setup-hook)


(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L]
(global-set-key [f3] 'split-window-vertically)
(global-set-key [f2] 'split-window-horizontally)
(global-set-key [f1] 'delete-other-windows) 
(global-set-key [f4] 'other-window) ; was center-line
(global-set-key [f5] 'compile) 
(global-set-key [f7] 'hippie-expand)
(global-set-key [f8] 'ispell)

(mwheel-install)
;; Setting Fullscreen option to alt+Enter
(defun toggle-fullscreen ()
 (interactive)
 (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))

(global-set-key [(meta return)] 'toggle-fullscreen)

;; Some Font-Lock Rules .....
(font-lock-add-keywords 'c++-mode '(
;; Currently support for []|&!.+=-/%*,()<>{}
("\\(\\[\\|\\]\\|[|!\\.\\+\\=\\&]\\|-\\|\\/\\|\\%\\|\\*\\|,\\|(\\|)\\|>\\ |<\\|{\\|}\\)" 1 font-lock-operator-face ) <BR> ; End of c++ statement ("\\(;\\)" 1 font-lock-end-statement ) )) 

(setq-default tab-width 2) ; Tab width set to 2 spaces
(setq-default indent-tabs-mode nil) ; Indentation cannot insert tabs
(add-hook 'c++-mode-hook '(lambda () (local-set-key "\C-m" 'c-context-line-break)))
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'substatement-open '0))) 

;; CEDET finding ....
(load-file "~/emacs/cedet/common/cedet.el")
(global-ede-mode t)

