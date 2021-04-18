;; essentials
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(global-set-key (kbd "C-c C-c") 'eval-region)

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)
(package-initialize)

;; Use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Evil
(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Themes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(use-package doom-modeline)
(doom-modeline-mode 1)
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Key bindings
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(nvmap :states '(normal visual) :keymaps 'override :prefix "SPC"
  "SPC"   '(counsel-M-x :which-key "M-x")
  ":"   '(execute-extended-command :which-key "M-x")
  "."     '(find-file :which-key "Find file")
  "f f"   '(find-file :which-key "Find file")
  "g g"   '(magit :which-key "Magit")
  "f r"   '(counsel-recentf :which-key "Recent files")
  "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")
  "h k" '(describe-key :which-key "Describe key")
  "h f" '(describe-function :which-key "Describe function")
  "h v" '(describe-variable :which-key "Describe variable")
  "t t"   '(toggle-truncate-lines :which-key "Toggle truncate lines"))


;; split windows and control
(nvmap :prefix "SPC"
       ;; Window splits
       "w c"   '(evil-window-delete :which-key "Close window")
       "w n"   '(evil-window-new :which-key "New window")
       "w s"   '(evil-window-split :which-key "Horizontal split window")
       "w v"   '(evil-window-vsplit :which-key "Vertical split window")
       ;; Window motions
       "w h"   '(evil-window-left :which-key "Window left")
       "w j"   '(evil-window-down :which-key "Window down")
       "w k"   '(evil-window-up :which-key "Window up")
       "w l"   '(evil-window-right :which-key "Window right")
       "w w"   '(evil-window-next :which-key "Goto next window"))


(use-package which-key
  :ensure t
  :init
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit t)
  :config
  (which-key-mode))


;; Auto complete
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

;; Magit
(use-package magit)
(use-package magit-todos
  :config (magit-todos-mode))


;; Ivy
(use-package counsel
  :after ivy
  :config (counsel-mode))
(use-package ivy
  :defer 0.1
  :diminish
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))
(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer)
  (ivy-rich-mode 1)) ;; this gets us descriptions in M-x.
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))(use-package counsel
  :after ivy
  :config (counsel-mode))


; Projectile
(use-package projectile
  :config
  (projectile-global-mode 1))
