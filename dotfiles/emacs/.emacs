
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote eshell))
 '(ivy-count-format "(%d/%d) ")
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t)
 '(markdown-command "pandoc -f markdown -t html")
 '(menu-bar-mode nil)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Ivy mode
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-h u") 'counsel-unicode-char)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Custom keybindings
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c R") 'replace-regexp)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Markdown configuration
(require 'markdown-mode)
(define-key markdown-mode-map (kbd "C-c m p") 'markdown-preview)
(define-key markdown-mode-map (kbd "C-c m h 1") 'markdown-insert-header-atx-1)
(define-key markdown-mode-map (kbd "C-c m h 2") 'markdown-insert-header-atx-2)
(define-key markdown-mode-map (kbd "C-c m l") 'markdown-insert-link)
(define-key markdown-mode-map (kbd "C-c m i") 'markdown-insert-italic)
(define-key markdown-mode-map (kbd "C-c m b") 'markdown-insert-bold)

;; Projectile configuration
(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
