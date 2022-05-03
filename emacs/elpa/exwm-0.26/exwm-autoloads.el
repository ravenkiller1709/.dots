;;; exwm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "exwm" "../../../../.config/emacs/elpa/exwm-0.26/exwm.el"
;;;;;;  "906b96d9d96f32b06f20983745e1931a")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm.el

(autoload 'exwm-restart "exwm" "\
Restart EXWM." t nil)

(autoload 'exwm-init "exwm" "\
Initialize EXWM.

\(fn &optional FRAME)" t nil)

(autoload 'exwm-exit "exwm" "\
Exit EXWM." t nil)

(autoload 'exwm-enable "exwm" "\
Enable/Disable EXWM.

\(fn &optional UNDO)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "exwm" "../../../../.config/emacs/elpa/exwm-0.26/exwm.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm" '("exwm-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-cm" "../../../../.config/emacs/elpa/exwm-0.26/exwm-cm.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-cm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-cm" '("exwm-cm-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-config"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-config" '("exwm-config-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-core" "../../../../.config/emacs/elpa/exwm-0.26/exwm-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-core" '("exwm-")))

;;;***

;;;### (autoloads nil "exwm-floating" "../../../../.config/emacs/elpa/exwm-0.26/exwm-floating.el"
;;;;;;  "499d8c0edc79738d8a6c873c8b5111ce")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-floating.el

(autoload 'exwm-floating-toggle-floating "exwm-floating" "\
Toggle the current window between floating and non-floating states." t nil)

(autoload 'exwm-floating-hide "exwm-floating" "\
Hide the current floating X window (which would show again when selected)." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "exwm-floating"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-floating.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-floating.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-floating" '("exwm-floating-")))

;;;***

;;;***

;;;### (autoloads nil "exwm-input" "../../../../.config/emacs/elpa/exwm-0.26/exwm-input.el"
;;;;;;  "72606ff054d6c9ada4bbaf56440a987f")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-input.el

(autoload 'exwm-input-set-key "exwm-input" "\
Set a global key binding.

The new key binding only takes effect in real time when this command is
called interactively, and is lost when this session ends unless it's
specifically saved in the Customize interface for `exwm-input-global-keys'.

In configuration you should customize or set `exwm-input-global-keys'
instead.

\(fn KEY COMMAND)" t nil)

(autoload 'exwm-input-grab-keyboard "exwm-input" "\
Switch to line-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-release-keyboard "exwm-input" "\
Switch to char-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-toggle-keyboard "exwm-input" "\
Toggle between 'line-mode' and 'char-mode'.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-send-next-key "exwm-input" "\
Send next key to client window.

EXWM will prompt for the key to send.  This command can be prefixed to send
multiple keys.  If END-KEY is non-nil, stop sending keys if it's pressed.

\(fn TIMES &optional END-KEY)" t nil)

(autoload 'exwm-input-set-simulation-key "exwm-input" "\
Set a simulation key.

The simulation key takes effect in real time, but is lost when this session
ends unless it's specifically saved in the Customize interface for
`exwm-input-simulation-keys'.

\(fn ORIGINAL-KEY SIMULATED-KEY)" t nil)

(autoload 'exwm-input-send-simulation-key "exwm-input" "\
Fake a key event according to the last input key sequence.

\(fn TIMES)" t nil)

(autoload 'exwm-input-invoke-factory "exwm-input" "\
Make a command that invokes KEYS when called.

One use is to access the keymap bound to KEYS (as prefix keys) in char-mode.

\(fn KEYS)" nil t)

;;;### (autoloads "actual autoloads are elsewhere" "exwm-input" "../../../../.config/emacs/elpa/exwm-0.26/exwm-input.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-input.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-input" '("exwm-input-")))

;;;***

;;;***

;;;### (autoloads nil "exwm-layout" "../../../../.config/emacs/elpa/exwm-0.26/exwm-layout.el"
;;;;;;  "c4bc351f2a34a039e1b06b5b58b94e8d")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-layout.el

(autoload 'exwm-layout-set-fullscreen "exwm-layout" "\
Make window ID fullscreen.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-unset-fullscreen "exwm-layout" "\
Restore window from fullscreen state.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-toggle-fullscreen "exwm-layout" "\
Toggle fullscreen mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-enlarge-window "exwm-layout" "\
Make the selected window DELTA pixels taller.

If no argument is given, make the selected window one pixel taller.  If the
optional argument HORIZONTAL is non-nil, make selected window DELTA pixels
wider.  If DELTA is negative, shrink selected window by -DELTA pixels.

Normal hints are checked and regarded if the selected window is displaying an
`exwm-mode' buffer.  However, this may violate the normal hints set on other X
windows.

\(fn DELTA &optional HORIZONTAL)" t nil)

(autoload 'exwm-layout-enlarge-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels wider.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window "exwm-layout" "\
Make the selected window DELTA pixels lower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels narrower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-hide-mode-line "exwm-layout" "\
Hide mode-line." t nil)

(autoload 'exwm-layout-show-mode-line "exwm-layout" "\
Show mode-line." t nil)

(autoload 'exwm-layout-toggle-mode-line "exwm-layout" "\
Toggle the display of mode-line." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "exwm-layout"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-layout.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-layout.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-layout" '("exwm-layout-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-manage"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-manage.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-manage.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-manage" '("exwm-manage-")))

;;;***

;;;### (autoloads nil "exwm-randr" "../../../../.config/emacs/elpa/exwm-0.26/exwm-randr.el"
;;;;;;  "f71c48533d19b0da552ac72e10f39948")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-randr.el

(autoload 'exwm-randr-refresh "exwm-randr" "\
Refresh workspaces according to the updated RandR info." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "exwm-randr" "../../../../.config/emacs/elpa/exwm-0.26/exwm-randr.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-randr.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-randr" '("exwm-randr-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-systemtray"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-systemtray.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-systemtray.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-systemtray" '("exwm-systemtray-" "xcb:systemtray:-ClientMessage")))

;;;***

;;;### (autoloads nil "exwm-workspace" "../../../../.config/emacs/elpa/exwm-0.26/exwm-workspace.el"
;;;;;;  "f6ada3f21d144ace7609df66811cfc94")
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-workspace.el

(autoload 'exwm-workspace--get-geometry "exwm-workspace" "\
Return the geometry of frame FRAME.

\(fn FRAME)" nil nil)

(autoload 'exwm-workspace--current-height "exwm-workspace" "\
Return the height of current workspace." nil nil)

(autoload 'exwm-workspace--minibuffer-own-frame-p "exwm-workspace" "\
Reports whether the minibuffer is displayed in its own frame." nil nil)

(autoload 'exwm-workspace-switch "exwm-workspace" "\
Switch to workspace INDEX (0-based).

Query for the index if not specified when called interactively.  Passing a
workspace frame as the first option or making use of the rest options are
for internal use only.

\(fn FRAME-OR-INDEX &optional FORCE)" t nil)

(autoload 'exwm-workspace-switch-create "exwm-workspace" "\
Switch to workspace INDEX or creating it first if it does not exist yet.

Passing a workspace frame as the first option is for internal use only.

\(fn FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-swap "exwm-workspace" "\
Interchange position of WORKSPACE1 with that of WORKSPACE2.

\(fn WORKSPACE1 WORKSPACE2)" t nil)

(autoload 'exwm-workspace-move "exwm-workspace" "\
Move WORKSPACE to the NTH position.

When called interactively, prompt for a workspace and move current one just
before it.

\(fn WORKSPACE NTH)" t nil)

(autoload 'exwm-workspace-add "exwm-workspace" "\
Add a workspace as the INDEX-th workspace, or the last one if INDEX is nil.

INDEX must not exceed the current number of workspaces.

\(fn &optional INDEX)" t nil)

(autoload 'exwm-workspace-delete "exwm-workspace" "\
Delete the workspace FRAME-OR-INDEX.

\(fn &optional FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-move-window "exwm-workspace" "\
Move window ID to workspace FRAME-OR-INDEX.

\(fn FRAME-OR-INDEX &optional ID)" t nil)

(autoload 'exwm-workspace-switch-to-buffer "exwm-workspace" "\
Make the current Emacs window display another buffer.

\(fn BUFFER-OR-NAME)" t nil)

(autoload 'exwm-workspace-attach-minibuffer "exwm-workspace" "\
Attach the minibuffer so that it always shows." t nil)

(autoload 'exwm-workspace-detach-minibuffer "exwm-workspace" "\
Detach the minibuffer so that it automatically hides." t nil)

(autoload 'exwm-workspace-toggle-minibuffer "exwm-workspace" "\
Attach the minibuffer if it's detached, or detach it if it's attached." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "exwm-workspace"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-workspace.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-workspace.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-workspace" '("exwm-workspace-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "exwm-xim" "../../../../.config/emacs/elpa/exwm-0.26/exwm-xim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.config/emacs/elpa/exwm-0.26/exwm-xim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-xim" '("exwm-xim-")))

;;;***

;;;### (autoloads nil nil ("../../../../.config/emacs/elpa/exwm-0.26/exwm-autoloads.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-cm.el" "../../../../.config/emacs/elpa/exwm-0.26/exwm-config.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-core.el" "../../../../.config/emacs/elpa/exwm-0.26/exwm-floating.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-input.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-layout.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-manage.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-pkg.el" "../../../../.config/emacs/elpa/exwm-0.26/exwm-randr.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-systemtray.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-workspace.el"
;;;;;;  "../../../../.config/emacs/elpa/exwm-0.26/exwm-xim.el" "../../../../.config/emacs/elpa/exwm-0.26/exwm.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; exwm-autoloads.el ends here
