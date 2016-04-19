---
title: Sender Addresses
permalink: /docs/sender-addresses/
jumbotron:
  title: Sender Addresses
  tagline: ...
---

Navigate to **Setup** >> **Mail** >> **Sender Addresses**.

These are the email addresses that you can send mail from.

Each sender address has the following options:

- **Email:** The sender email address that recipients will see in the `From:` field (e.g. `support@example.com`).

- **Name:** The sender personal name that recipients will see in the `From:` field (e.g. `Support Team @ Example Inc.`).

- **Default signature:** The signature that will be automatically added to all outgoing messages from this sender when no other signature is specified.

- **Send mail using this transport:** The [mail transport](/docs/mail-transports) used to deliver messages from this sender.

- **Send HTML replies using this template:** An HTML layout and theme to use for messages sent from this sender.

- **Make default:** When this box is checked, this sender address will be used to send messages from all groups and buckets that don't specify their own sender.

(( SMTP server MAIL FROM auth ))

Make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains.

# References

[^rbl-check]: <http://www.anti-abuse.org/multi-rbl-check/>