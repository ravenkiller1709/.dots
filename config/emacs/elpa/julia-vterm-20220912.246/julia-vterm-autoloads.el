;;; julia-vterm-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "julia-vterm" "julia-vterm.el" (0 0 0 0))
;;; Generated autoloads from julia-vterm.el

(autoload 'julia-vterm-mode "julia-vterm" "\
A minor mode for a Julia script buffer that interacts with an inferior Julia REPL.

This is a minor mode.  If called interactively, toggle the
`Julia-Vterm mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `julia-vterm-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "julia-vterm" '("julia-vterm-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; julia-vterm-autoloads.el ends here
