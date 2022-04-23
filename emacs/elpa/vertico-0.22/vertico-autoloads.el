;;; vertico-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vertico" "../../../../.config/emacs/elpa/vertico-0.22/vertico.el"
;;;;;;  "01d78b9f328f92e35cd17fc0b68cfc37")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico.el

(defvar vertico-mode nil "\
Non-nil if Vertico mode is enabled.
See the `vertico-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-mode'.")

(custom-autoload 'vertico-mode "vertico" nil)

(autoload 'vertico-mode "vertico" "\
VERTical Interactive COmpletion.

If called interactively, enable Vertico mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico" "../../../../.config/emacs/elpa/vertico-0.22/vertico.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico" '("vertico-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-buffer" "../../../../.config/emacs/elpa/vertico-0.22/vertico-buffer.el"
;;;;;;  "45764719745ee2ca38b26f7e11042377")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-buffer.el

(defvar vertico-buffer-mode nil "\
Non-nil if Vertico-Buffer mode is enabled.
See the `vertico-buffer-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-buffer-mode'.")

(custom-autoload 'vertico-buffer-mode "vertico-buffer" nil)

(autoload 'vertico-buffer-mode "vertico-buffer" "\
Display Vertico in a buffer instead of the minibuffer.

If called interactively, enable Vertico-Buffer mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-buffer"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-buffer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-buffer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-buffer" '("vertico-buffer-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-directory" "../../../../.config/emacs/elpa/vertico-0.22/vertico-directory.el"
;;;;;;  "92dcfec56a9bd989cbca9a53b3d7ce2f")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-directory.el

(autoload 'vertico-directory-enter "vertico-directory" "\
Enter directory or exit completion with current candidate." t nil)

(autoload 'vertico-directory-up "vertico-directory" "\
Delete N directories before point.

\(fn &optional N)" t nil)

(autoload 'vertico-directory-delete-char "vertico-directory" "\
Delete N directories or chars before point.

\(fn &optional N)" t nil)

(autoload 'vertico-directory-delete-word "vertico-directory" "\
Delete N directories or words before point.

\(fn &optional N)" t nil)

(autoload 'vertico-directory-tidy "vertico-directory" "\
Tidy shadowed file name, see `rfn-eshadow-overlay'." nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-directory"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-directory.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-directory.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-directory" '("vertico-directory--completing-file-p")))

;;;***

;;;***

;;;### (autoloads nil "vertico-flat" "../../../../.config/emacs/elpa/vertico-0.22/vertico-flat.el"
;;;;;;  "ab49cb2d8f02afe20304b96d592ff178")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-flat.el

(defvar vertico-flat-mode nil "\
Non-nil if Vertico-Flat mode is enabled.
See the `vertico-flat-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-flat-mode'.")

(custom-autoload 'vertico-flat-mode "vertico-flat" nil)

(autoload 'vertico-flat-mode "vertico-flat" "\
Flat, horizontal display for Vertico.

If called interactively, enable Vertico-Flat mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-flat"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-flat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-flat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-flat" '("vertico-flat-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-grid" "../../../../.config/emacs/elpa/vertico-0.22/vertico-grid.el"
;;;;;;  "66aabac9fc25bc458e4f71bcd948acac")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-grid.el

(defvar vertico-grid-mode nil "\
Non-nil if Vertico-Grid mode is enabled.
See the `vertico-grid-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-grid-mode'.")

(custom-autoload 'vertico-grid-mode "vertico-grid" nil)

(autoload 'vertico-grid-mode "vertico-grid" "\
Grid display for Vertico.

If called interactively, enable Vertico-Grid mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-grid"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-grid.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-grid.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-grid" '("vertico-grid-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-indexed" "../../../../.config/emacs/elpa/vertico-0.22/vertico-indexed.el"
;;;;;;  "9772aa675e76563e7f4a3dd9a8206b20")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-indexed.el

(defvar vertico-indexed-mode nil "\
Non-nil if Vertico-Indexed mode is enabled.
See the `vertico-indexed-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-indexed-mode'.")

(custom-autoload 'vertico-indexed-mode "vertico-indexed" nil)

(autoload 'vertico-indexed-mode "vertico-indexed" "\
Prefix candidates with indices.

If called interactively, enable Vertico-Indexed mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-indexed"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-indexed.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-indexed.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-indexed" '("vertico-indexed--")))

;;;***

;;;***

;;;### (autoloads nil "vertico-mouse" "../../../../.config/emacs/elpa/vertico-0.22/vertico-mouse.el"
;;;;;;  "8789ae07d9794d8170e2b8f6dd6b2289")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-mouse.el

(defvar vertico-mouse-mode nil "\
Non-nil if Vertico-Mouse mode is enabled.
See the `vertico-mouse-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-mouse-mode'.")

(custom-autoload 'vertico-mouse-mode "vertico-mouse" nil)

(autoload 'vertico-mouse-mode "vertico-mouse" "\
Mouse support for Vertico.

If called interactively, enable Vertico-Mouse mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-mouse"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-mouse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-mouse.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-mouse" '("vertico-mouse--")))

;;;***

;;;***

;;;### (autoloads nil "vertico-multiform" "../../../../.config/emacs/elpa/vertico-0.22/vertico-multiform.el"
;;;;;;  "813dc12b645af3de55dabf83d64796eb")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-multiform.el

(defvar vertico-multiform-mode nil "\
Non-nil if Vertico-Multiform mode is enabled.
See the `vertico-multiform-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-multiform-mode'.")

(custom-autoload 'vertico-multiform-mode "vertico-multiform" nil)

(autoload 'vertico-multiform-mode "vertico-multiform" "\
Configure Vertico in various forms per command.

If called interactively, enable Vertico-Multiform mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-multiform"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-multiform.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-multiform.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-multiform" '("vertico-multiform-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-quick" "../../../../.config/emacs/elpa/vertico-0.22/vertico-quick.el"
;;;;;;  "507cc03956ee292231640bd72be586a7")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-quick.el

(autoload 'vertico-quick-jump "vertico-quick" "\
Jump to candidate using quick keys." t nil)

(autoload 'vertico-quick-exit "vertico-quick" "\
Exit with candidate using quick keys." t nil)

(autoload 'vertico-quick-insert "vertico-quick" "\
Insert candidate using quick keys." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-quick"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-quick.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-quick.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-quick" '("vertico-quick")))

;;;***

;;;***

;;;### (autoloads nil "vertico-repeat" "../../../../.config/emacs/elpa/vertico-0.22/vertico-repeat.el"
;;;;;;  "d503a706e16418a8c804e04e39606f7d")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-repeat.el

(autoload 'vertico-repeat-save "vertico-repeat" "\
Save Vertico session for `vertico-repeat'.
This function must be registered as `minibuffer-setup-hook'." nil nil)

(autoload 'vertico-repeat-last "vertico-repeat" "\
Repeat last Vertico completion SESSION.

\(fn &optional SESSION)" t nil)

(autoload 'vertico-repeat-select "vertico-repeat" "\
Select a Vertico session from the session history and repeat it." t nil)

(autoload 'vertico-repeat "vertico-repeat" "\
Repeat last Vertico session.
If prefix ARG is non-nil, offer completion menu to select from session history.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-repeat"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-repeat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-repeat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-repeat" '("vertico-repeat-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-reverse" "../../../../.config/emacs/elpa/vertico-0.22/vertico-reverse.el"
;;;;;;  "b6e0c367cc1e2cadd4148bbe6e3db799")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-reverse.el

(defvar vertico-reverse-mode nil "\
Non-nil if Vertico-Reverse mode is enabled.
See the `vertico-reverse-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-reverse-mode'.")

(custom-autoload 'vertico-reverse-mode "vertico-reverse" nil)

(autoload 'vertico-reverse-mode "vertico-reverse" "\
Reverse the Vertico display.

If called interactively, enable Vertico-Reverse mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-reverse"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-reverse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-reverse.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-reverse" '("vertico-reverse-")))

;;;***

;;;***

;;;### (autoloads nil "vertico-unobtrusive" "../../../../.config/emacs/elpa/vertico-0.22/vertico-unobtrusive.el"
;;;;;;  "12984da08b9e3b3a80bbe9eb13295359")
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-unobtrusive.el

(defvar vertico-unobtrusive-mode nil "\
Non-nil if Vertico-Unobtrusive mode is enabled.
See the `vertico-unobtrusive-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-unobtrusive-mode'.")

(custom-autoload 'vertico-unobtrusive-mode "vertico-unobtrusive" nil)

(autoload 'vertico-unobtrusive-mode "vertico-unobtrusive" "\
Unobtrusive display for Vertico.

If called interactively, enable Vertico-Unobtrusive mode if ARG
is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vertico-unobtrusive"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-unobtrusive.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/vertico-0.22/vertico-unobtrusive.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vertico-unobtrusive" '("vertico-unobtrusive--orig-count")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.config/emacs/elpa/vertico-0.22/vertico-autoloads.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-buffer.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-directory.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-flat.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-grid.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-indexed.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-mouse.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-multiform.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-pkg.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-quick.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-repeat.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-reverse.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico-unobtrusive.el"
;;;;;;  "../../../../.config/emacs/elpa/vertico-0.22/vertico.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vertico-autoloads.el ends here
