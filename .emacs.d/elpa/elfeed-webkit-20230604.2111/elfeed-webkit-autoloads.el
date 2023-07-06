;;; elfeed-webkit-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elfeed-webkit" "elfeed-webkit.el" (0 0 0 0))
;;; Generated autoloads from elfeed-webkit.el

(autoload 'elfeed-webkit-toggle "elfeed-webkit" "\
Toggle rendering of elfeed entries with webkit on/off." t nil)

(define-obsolete-function-alias 'elfeed-webkit-auto-enable-by-tag 'elfeed-webkit-auto-toggle-by-tag "0.2")

(autoload 'elfeed-webkit-auto-toggle-by-tag "elfeed-webkit" "\
Automatically toggle rendering of elfeed entries with webkit on/off.

If an entry has a tag listed in `elfeed-webkit-auto-enable-tags',
render it with webkit when it is shown.  Likewise, if an entry
has a tag listed in `elfeed-webkit-auto-disable-tags', render it
with the original/default method.

Rendering with webkit can still be toggled on or off manually in
the entry's buffer." t nil)

(register-definition-prefixes "elfeed-webkit" '("elfeed-webkit-"))

;;;***

;;;### (autoloads nil nil ("elfeed-webkit-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elfeed-webkit-autoloads.el ends here
