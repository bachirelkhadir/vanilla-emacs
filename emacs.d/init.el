;; essentials
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(global-set-key (kbd "C-c C-c") 'eval-region)

(setq user-emacs-directory "~/.emacs.user.d/")

;; Modular emacs config
(defconst bac:emacs-config-dir "~/.emacs.d/config/"
  "Directory to store config files")

;; utility function to auto-load my package configurations
(defun bac:load-config-file (filelist)
(dolist (file filelist)
    (load (expand-file-name 
	    (concat bac:emacs-config-dir file)))
    (message "Loaded config file:%s" file)
    ))

(bac:load-config-file '(
			"startup_config"
			"package_config"
			"evil_config"
			"theme_config"
			"key_config"
			"ivy_config"
			))


;; Auto complete
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

;; Magit
(use-package magit
  :config
  (general-override-mode)) ; respect general "override" keymap

(use-package magit-todos
  :config
  (magit-todos-mode))



; Projectile
(use-package projectile
  :config
  (projectile-global-mode 1))
