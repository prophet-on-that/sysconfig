
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
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(geiser-active-implementations (quote (guile)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote eshell))
 '(ivy-count-format "(%d/%d) ")
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t)
 '(js-curly-indent-offset 2)
 '(js-enabled-frameworks (quote (javascript)))
 '(js-expr-indent-offset 2)
 '(js-indent-level 2)
 '(js-paren-indent-offset 2)
 '(js-square-indent-offset 2)
 '(markdown-command "pandoc -f markdown -t html")
 '(menu-bar-mode nil)
 '(org-agenda-span 7)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-start-with-follow-mode t)
 '(org-deadline-warning-days 2)
 '(org-log-done (quote note))
 '(org-log-into-drawer t)
 '(org-tags-column 90)
 '(org-todo-keyword-faces (quote (("ASSIGNED" . "goldenrod3"))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t!/!)" "ASSIGNED(a@/!)" "DONE(d@)"))))
 '(projectile-completion-system (quote ivy))
 '(projectile-use-git-grep t)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(show-paren-delay 0)
 '(show-paren-mode t)
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
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Paredit configuration
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'geiser-repl-mode-hook #'enable-paredit-mode)

;; Org mode
(require 'org)
(setq org-agenda-files (list org-directory))
(global-set-key "\C-coc" 'org-capture)
(global-set-key "\C-coa" 'org-agenda)
(setq org-agenda-include-diary t)
(setq org-agenda-start-day "-1d")

(defun org-insert-current-time-stamp (with-hm)
   "Insert the current time as an inactive org timestamp. WITH-HM
means user the stamp format that includes the time of day."
   (org-insert-time-stamp (current-time) with-hm t))
(define-key org-mode-map (kbd "C-c t")
  (lambda ()
    (interactive)
    (org-insert-current-time-stamp nil)))
(define-key org-mode-map (kbd "C-c T")
  (lambda ()
    (interactive)
    (org-insert-current-time-stamp t)))

(defun org-agenda-diary-cleanup-desc ()
  "Remove description included by default in org agenda diary
  entry."
  (goto-char (point-min))
  (while (re-search-forward "; Desc: [^\"]*" nil t)
    (replace-match "")))

(add-hook 'org-agenda-cleanup-fancy-diary-hook 'org-agenda-diary-cleanup-desc)

;; Load system-local configuration, if it exists
(let ((local-config-file "~/.emacs-local.el"))
  (if (file-exists-p local-config-file)
      (load local-config-file)))
