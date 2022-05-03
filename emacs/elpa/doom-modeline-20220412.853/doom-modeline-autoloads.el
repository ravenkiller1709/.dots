;;; doom-modeline-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "doom-modeline" "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline.el"
;;;;;;  "e2312eebdc786e8a6f80b1aba6641675")
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline.el

(autoload 'doom-modeline-init "doom-modeline" "\
Initialize doom mode-line." nil nil)

(autoload 'doom-modeline-set-main-modeline "doom-modeline" "\
Set main mode-line.
If DEFAULT is non-nil, set the default mode-line for all buffers.

\(fn &optional DEFAULT)" nil nil)

(autoload 'doom-modeline-set-minimal-modeline "doom-modeline" "\
Set minimal mode-line." nil nil)

(autoload 'doom-modeline-set-special-modeline "doom-modeline" "\
Set special mode-line." nil nil)

(autoload 'doom-modeline-set-project-modeline "doom-modeline" "\
Set project mode-line." nil nil)

(autoload 'doom-modeline-set-dashboard-modeline "doom-modeline" "\
Set dashboard mode-line." nil nil)

(autoload 'doom-modeline-set-vcs-modeline "doom-modeline" "\
Set vcs mode-line." nil nil)

(autoload 'doom-modeline-set-info-modeline "doom-modeline" "\
Set Info mode-line." nil nil)

(autoload 'doom-modeline-set-package-modeline "doom-modeline" "\
Set package mode-line." nil nil)

(autoload 'doom-modeline-set-media-modeline "doom-modeline" "\
Set media mode-line." nil nil)

(autoload 'doom-modeline-set-message-modeline "doom-modeline" "\
Set message mode-line." nil nil)

(autoload 'doom-modeline-set-pdf-modeline "doom-modeline" "\
Set pdf mode-line." nil nil)

(autoload 'doom-modeline-set-org-src-modeline "doom-modeline" "\
Set org-src mode-line." nil nil)

(autoload 'doom-modeline-set-helm-modeline "doom-modeline" "\
Set helm mode-line.

\(fn &rest _)" nil nil)

(autoload 'doom-modeline-set-timemachine-modeline "doom-modeline" "\
Set timemachine mode-line." nil nil)

(defvar doom-modeline-mode nil "\
Non-nil if Doom-Modeline mode is enabled.
See the `doom-modeline-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `doom-modeline-mode'.")

(custom-autoload 'doom-modeline-mode "doom-modeline" nil)

(autoload 'doom-modeline-mode "doom-modeline" "\
Toggle doom-modeline on or off.

If called interactively, enable Doom-Modeline mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "doom-modeline"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-modeline" '("doom-modeline-mode-map")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "doom-modeline-core"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-modeline-core" '("doom-modeline")))

;;;***

;;;### (autoloads nil "doom-modeline-env" "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-env.el"
;;;;;;  "9b442575617512b0bf1f5ec8b60cac3c")
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-env.el
 (autoload 'doom-modeline-env-setup-python "doom-modeline-env")
 (autoload 'doom-modeline-env-setup-ruby "doom-modeline-env")
 (autoload 'doom-modeline-env-setup-perl "doom-modeline-env")
 (autoload 'doom-modeline-env-setup-go "doom-modeline-env")
 (autoload 'doom-modeline-env-setup-elixir "doom-modeline-env")
 (autoload 'doom-modeline-env-setup-rust "doom-modeline-env")

;;;### (autoloads "actual autoloads are elsewhere" "doom-modeline-env"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-env.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-env.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-modeline-env" '("doom-modeline-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "doom-modeline-segments"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-segments.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-segments.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-modeline-segments" '("doom-modeline-")))

;;;***

;;;### (autoloads nil nil ("../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-autoloads.el"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-core.el"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-env.el"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-pkg.el"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline-segments.el"
;;;;;;  "../../../../.config/emacs/elpa/doom-modeline-20220412.853/doom-modeline.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; doom-modeline-autoloads.el ends here
