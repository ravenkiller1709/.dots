;;; config.el -- Example Rational Emacs user customization file -*- lexical-binding: t; -*-
;; This file is generated from config.org. If you want to edit the
;; configuration, DO NOT edit config.el, edit config.org, instead.

;; Tangle the code blocks to config.el on save.
(defun org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "config.org" rational-config-path))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'org-babel-tangle-config)))

(require 'rational-defaults)    ; Sensible default settings for Emacs
(require 'rational-use-package) ; Configuration for `use-package`
(require 'rational-updates)     ; Tools to upgrade Rational Emacs
(require 'rational-completion)  ; selection framework based on `vertico`
(require 'rational-ui)          ; Better UI experience (modeline etc.)
(require 'rational-windows)     ; Window management configuration
(require 'rational-editing)     ; Whitspace trimming, auto parens etc.
;(require 'rational-evil)        ; An `evil-mode` configuration
(require 'rational-org)         ; org-appear, clickable hyperlinks etc.
(require 'rational-project)     ; built-in alternative to projectile
(require 'rational-speedbar)    ; built-in file-tree
(require 'rational-screencast)  ; show current command and binding in modeline
(require 'rational-compile)     ; automatically compile some emacs lisp files

(custom-set-variables
   '(rational-ui-default-font
     '(:font "JetBrains Mono" :weight light :height 185)))

(rational-package-install-package 'doom-themes)
(load-theme 'doom-city-lights t)

(use-package doom-modeline
   :ensure t
   :init (doom-modeline-mode 1)
   :custom ((doom-modeline-height 35)
            (doom-modeline-bar-width 10)
            (doom-modeline-buffer-file-name-style 'auto)
            (doom-modeline-icon (display-graphic-p))
            (doom-modeline-major-mode-icon t)
            (doom-modeline-major-mode-color-icon t)
            (doom-modeline-enable-word-count t)
            (doom-modeline-modal-icon t)
            (doom-modeline-mu4e nil)
            (mu4e-alert-enable-mode-line-display)))

 (display-battery-mode 1)

 ;; Turn on `display-time-mode' if you don't use an external bar.
 (setq display-time-default-load-average nil)

 (display-time-mode t)

 (setq display-time-24hr-format 1)

 ;;(display-time-mode nil)
 ;;(setq display-time-24hr-format nil)

(setenv "GPG_AGENT_INFO" nil)  ;; use emacs pinentry
    (setq auth-source-debug t)

    (setq epg-gpg-program "gpg2")  ;; not necessary
    (require 'epa-file)
    (epa-file-enable)
;;(setq epa-pinentry-mode 'loopback)
(setq epg-pinentry-mode 'loopback)

    (require 'org-crypt)
    (org-crypt-use-before-save-magic)

(defun efs/lookup-password (&rest keys)
  (let ((result (apply #'auth-source-search keys)))
    (if result
	(funcall (plist-get (car result) :secret))
      nil)))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq enable-recursive-minibuffers t)
)
  (use-package swiper
    :ensure try
    :bind (("C-s" . swiper)
	   ("C-r" . swiper)
	   ("C-c C-r" . ivy-resume)
	   ("M-x" . counsel-M-x)
	   ("C-x C-f" . counsel-find-file))
    :config
    (progn
      (ivy-mode 1)
      (setq ivy-use-virtual-buffers t)
      (setq ivy-display-style 'fancy)
      (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
      ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

  (setq org-ellipsis " ▾")

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 80
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

 (setq org-latex-pdf-process
	  '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

(require 'org-tempo)


(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

    (add-to-list 'org-latex-classes
		 '("ethz"
		   "\\documentclass[a4paper,11pt,titlepage]{memoir}
    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}
    \\usepackage{fixltx2e}
    \\usepackage{graphicx}
    \\usepackage{longtable}
    \\usepackage{float}
    \\usepackage{wrapfig}
    \\usepackage{rotating}
    \\usepackage[normalem]{ulem}
    \\usepackage{amsmath}
    \\usepackage{textcomp}
    \\usepackage{marvosym}
    \\usepackage{wasysym}
    \\usepackage{amssymb}
    \\usepackage{hyperref}
    \\usepackage{mathpazo}
    \\usepackage{color}
    \\usepackage{enumerate}
    \\definecolor{bg}{rgb}{0.95,0.95,0.95}
    \\tolerance=1000
	  [NO-DEFAULT-PACKAGES]
	  [PACKAGES]
	  [EXTRA]
    \\linespread{1.1}
    \\hypersetup{pdfborder=0 0 0}"
		   ("\\chapter{%s}" . "\\chapter*{%s}")
		   ("\\section{%s}" . "\\section*{%s}")
		   ("\\subsection{%s}" . "\\subsection*{%s}")
		   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		   ("\\paragraph{%s}" . "\\paragraph*{%s}")
		   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


    (add-to-list 'org-latex-classes
		 '("article"
		   "\\documentclass[11pt,a4paper]{article}
    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}
    \\usepackage{fixltx2e}
    \\usepackage{graphicx}
    \\usepackage{longtable}
    \\usepackage{float}
    \\usepackage{wrapfig}
    \\usepackage{rotating}
    \\usepackage[normalem]{ulem}
    \\usepackage{amsmath}
    \\usepackage{textcomp}
    \\usepackage{marvosym}
    \\usepackage{wasysym}
    \\usepackage{amssymb}
    \\usepackage{hyperref}
    \\usepackage{mathpazo}
    \\usepackage{color}
    \\usepackage{enumerate}
    \\definecolor{bg}{rgb}{0.95,0.95,0.95}
    \\tolerance=1000
	  [NO-DEFAULT-PACKAGES]
	  [PACKAGES]
	  [EXTRA]
    \\linespread{1.1}
    \\hypersetup{pdfborder=0 0 0}"
		   ("\\section{%s}" . "\\section*{%s}")
		   ("\\subsection{%s}" . "\\subsection*{%s}")
		   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		   ("\\paragraph{%s}" . "\\paragraph*{%s}")))


    (add-to-list 'org-latex-classes '("ebook"
				      "\\documentclass[11pt, oneside]{memoir}
    \\setstocksize{9in}{6in}
    \\settrimmedsize{\\stockheight}{\\stockwidth}{*}
    \\setlrmarginsandblock{2cm}{2cm}{*} % Left and right margin
    \\setulmarginsandblock{2cm}{2cm}{*} % Upper and lower margin
    \\checkandfixthelayout
    % Much more laTeX code omitted
    "
				      ("\\chapter{%s}" . "\\chapter*{%s}")
				      ("\\section{%s}" . "\\section*{%s}")
				      ("\\subsection{%s}" .
"\\subsection*{%s}")))

(use-package mu4e
  :ensure nil
  :config

  ;;this is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  ;;(setq mu4e-maildir "~/Mail")

  ;; Configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)

  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "Work"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/nepgroup" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "kkruse@nepgroup.com")
                  (user-full-name    . "Kim Kruse")
		  (smtpmail-smtp-server  . "smtp.office365.com")
                  (smtpmail-smtp-service . 587)
                  (smtpmail-stream-type  . ssl)
                  (mu4e-drafts-folder  . "/nepgroup/Drafts")
                  (mu4e-sent-folder  . "/nepgroup/Sendt Post")
                  (mu4e-refile-folder  . "/nepgroup/Indbakke")
                  (mu4e-trash-folder  . "/nepgroup/Slettet Post")))

	 ;; Hotmail account
;;         (make-mu4e-context
;;          :name "Hotmail"
;;          :match-func
;;            (lambda (msg)
;;              (when msg
;;                (string-prefix-p "/Hotmail" (mu4e-message-field msg :maildir))))
;;          :vars '((user-mail-address . "kimkruse@hotmail.com")
;;                  (user-full-name    . "Kim Kruse")
;;		  (smtpmail-smtp-server  . "smtp-mail.outlook.com")
;;                  (smtpmail-smtp-service . 58;;7)
;;                  (smtpmail-stream-type  . st;;arttls)
;;                  (mu4e-drafts-folder  . "/Ho;;tmail/Drafts")
;;                  (mu4e-sent-folder  . "/Hotm;;ail/Sent Mail")
;;                  (mu4e-refile-folder  . "/Ho;;tmail/Alle mails")
;;                  (mu4e-trash-folder  . "/Hot;;mail/Trash")))

         ;; Personal account
         (make-mu4e-context
          :name "Personal"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/kimkruse" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "kim@kimkruse.xyz")
                  (user-full-name    . "Kim Kruse")
		  (smtpmail-smtp-server . "mail.kimkruse.xyz")
		  (smtpmail-smtp-service . 587)
		  (smtpmail-stream-type . starttls)
                  (mu4e-drafts-folder  . "/kimkruse/Drafts")
                  (mu4e-sent-folder  . "/kimkruse/Sent")
                  (mu4e-refile-folder  . "/kimkruse/Archive")
                  (mu4e-trash-folder  . "/kimkruse/Trash")))))

  (setq mu4e-maildir-shortcuts
      '(("/kimkruse/Inbox"             . ?i)
        ("/kimkruse/Sent" . ?s)
        ("/nepgroup/INBOX"    . ?d)
        ("/nepgroup/'Sendt Post'"     . ?t))))

;; To not load `custom.el' after `config.el', uncomment this line.
;; (setq rational-load-custom-file nil)
