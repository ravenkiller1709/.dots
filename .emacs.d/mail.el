(use-package mu4e
  :ensure nil
  :config

  ;;this is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  ;; Configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)

  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "Hotmail"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Hotmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "kimkruse@hotmail.com")
                  (user-full-name    . "Kim Kruse")
		  (smtpmail-smtp-server  . "smtp.office365.com")
                  (smtpmail-smtp-service . 587)
                  (smtpmail-stream-type  . ssl)
                  (mu4e-drafts-folder  . "/Hotmail/Drafts")
                  (mu4e-sent-folder  . "/Hotmail/Sendt Post")
                  (mu4e-refile-folder  . "/Hotmail/Indbakke")
                  (mu4e-trash-folder  . "/Hotmail/Slettet Post")))

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
      '(("/kimkruse/INBOX"             . ?i)
        ("/kimkruse/Sent" . ?s)
        ("/hotmail/INBOX"    . ?d)
        ("/hotmail/'Sendt Post'"     . ?t))))
