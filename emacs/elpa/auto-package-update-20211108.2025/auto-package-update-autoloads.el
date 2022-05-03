;;; auto-package-update-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-package-update" "../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update.el"
;;;;;;  "e9382ea4b959a9ff1b1d6211727524df")
;;; Generated autoloads from ../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update.el

(autoload 'auto-package-update-now "auto-package-update" "\
Update installed Emacs packages.

\(fn &optional ASYNC)" t nil)

(autoload 'auto-package-update-now-async "auto-package-update" "\
Update installed Emacs packages with an async manner.
If FORCE is non-nil, kill the update thread anyway.

\(fn &optional FORCE)" t nil)

(autoload 'auto-package-update-at-time "auto-package-update" "\
Try to update every day at the specified TIME.

\(fn TIME)" nil nil)

(autoload 'auto-package-update-maybe "auto-package-update" "\
Update installed Emacs packages if at least
`auto-package-update-interval' days have passed since the last
update." nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "auto-package-update"
;;;;;;  "../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-package-update" '("apu--" "auto-package-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update-autoloads.el"
;;;;;;  "../../../../.config/emacs/elpa/auto-package-update-20211108.2025/auto-package-update.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-package-update-autoloads.el ends here
