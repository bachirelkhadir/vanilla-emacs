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
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))

;; Themes

;; Key bindings
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(nvmap :states '(normal visual) :keymaps 'override :prefix "SPC"
  "SPC"   '(counsel-M-x :which-key "M-x")
  "."     '(find-file :which-key "Find file")
  "f r"   '(counsel-recentf :which-key "Recent files")
  "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")
  "t t"   '(toggle-truncate-lines :which-key "Toggle truncate lines"))



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


(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))
