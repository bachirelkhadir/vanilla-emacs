;; Themes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(use-package doom-modeline)
(doom-modeline-mode 1)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-dracula t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config)
  )

; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))


(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Look and feel
(defalias 'yes-or-no-p 'y-or-n-p)

;; Highlight matching parens
(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#000000")
  (show-paren-mode 1))


