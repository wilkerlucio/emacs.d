;;; doremi-mac-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (define-doremi define-doremi-after-hook define-doremi-before-hook)
;;;;;;  "doremi-mac" "doremi-mac.el" (21498 22176 0 0))
;;; Generated autoloads from doremi-mac.el

(defvar define-doremi-before-hook nil "\
*Normal hook (list of functions) run before `doremi' is run.
See `run-hooks'.")

(custom-autoload 'define-doremi-before-hook "doremi-mac" t)

(defvar define-doremi-after-hook nil "\
*Normal hook (list of functions) run after `doremi' is run.
See `run-hooks'.")

(custom-autoload 'define-doremi-after-hook "doremi-mac" t)

(autoload 'define-doremi "doremi-mac" "\
Define a Do Re Mi command.
CMD-NAME is the name of the command, to be prefixed by `doremi-'.
DOC-STRING is the documentation string for the new command.
CMD-MENU-NAME is the menu name for the command (a string).

The other arguments are as for command `doremi', except that the
`doremi' increment argument is not an argument to
`define-doremi'. The new command has a single, optional argument,
INCREMENT, provided interactively by the prefix argument.

\(fn CMD-NAME DOC-STRING CMD-MENU-NAME SETTER-FN INIT-VAL &optional GROW-FN-P ENUM ALLOW-NEW-P)" nil t)

;;;***

;;;### (autoloads nil nil ("doremi-mac-pkg.el") (21498 22176 625024
;;;;;;  0))

;;;***

(provide 'doremi-mac-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; doremi-mac-autoloads.el ends here
