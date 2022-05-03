;;; orderless-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "orderless" "../../../../.config/emacs/elpa/orderless-20220418.2119/orderless.el"
;;;;;;  "3ef9a33b42a895b49e55dc60deee0c0d")
;;; Generated autoloads from ../../../../.config/emacs/elpa/orderless-20220418.2119/orderless.el

(autoload 'orderless-filter "orderless" "\
Split STRING into components and find entries TABLE matching all.
The predicate PRED is used to constrain the entries in TABLE.

\(fn STRING TABLE &optional PRED)" nil nil)

(autoload 'orderless-all-completions "orderless" "\
Split STRING into components and find entries TABLE matching all.
The predicate PRED is used to constrain the entries in TABLE.  The
matching portions of each candidate are highlighted.
This function is part of the `orderless' completion style.

\(fn STRING TABLE PRED POINT)" nil nil)

(autoload 'orderless-try-completion "orderless" "\
Complete STRING to unique matching entry in TABLE.
This uses `orderless-all-completions' to find matches for STRING
in TABLE among entries satisfying PRED.  If there is only one
match, it completes to that match.  If there are no matches, it
returns nil.  In any other case it \"completes\" STRING to
itself, without moving POINT.
This function is part of the `orderless' completion style.

\(fn STRING TABLE PRED POINT)" nil nil)

(add-to-list 'completion-styles-alist '(orderless orderless-try-completion orderless-all-completions "Completion of multiple components, in any order."))

(autoload 'orderless-ivy-re-builder "orderless" "\
Convert STR into regexps for use with ivy.
This function is for integration of orderless with ivy, use it as
a value in `ivy-re-builders-alist'.

\(fn STR)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "orderless" "../../../../.config/emacs/elpa/orderless-20220418.2119/orderless.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/orderless-20220418.2119/orderless.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "orderless" '("orderless-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.config/emacs/elpa/orderless-20220418.2119/orderless-autoloads.el"
;;;;;;  "../../../../.config/emacs/elpa/orderless-20220418.2119/orderless-pkg.el"
;;;;;;  "../../../../.config/emacs/elpa/orderless-20220418.2119/orderless.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; orderless-autoloads.el ends here
