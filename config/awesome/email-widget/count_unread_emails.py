#!/usr/bin/python

import imaplib
import re

M=imaplib.IMAP4_SSL("mail.kimkruse.xyz", 993)
M.login("kim","aFR8of55")

status, counts = M.status("INBOX","(MESSAGES UNSEEN)")

if status == "OK":
	unread = re.search(r'UNSEEN\s(\d+)', counts[0].decode('utf-8')).group(1)
else:
	unread = "N/A"

print(unread)
