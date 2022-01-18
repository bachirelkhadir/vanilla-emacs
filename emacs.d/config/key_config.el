;; Key bindings
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(nvmap  :prefix "SPC"
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
  "c c" '(compile :which-key "Compile")
  "c C" '(recompile :which-key "Recompile")
  )


;; Split windows and control
;; The :keymaps override is meant to prevent other modes from overriding it.
(nvmap :prefix "SPC" :keymaps 'override
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
       "w w"   '(evil-window-next :which-key "Goto next window")
       ","   '(counsel-switch-buffer :which-key "Switch buffer"))

;; buffer management

(nvmap
  "zx" '(kill-current-buffer :which-key "Kill current buffer"))

;; UI toggle
(nvmap  :prefix "SPC"
  "t"  '(:ignore t :which-key "toggles")
  "tw" 'whitespace-mode
  "t t" '(counsel-load-theme :which-key "choose theme")
  "t l"   '(toggle-truncate-lines :which-key "Toggle truncate lines"))

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
