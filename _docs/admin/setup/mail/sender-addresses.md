---
title: Sender Addresses
permalink: /docs/setup/sender-addresses/
jumbotron:
  title: Sender Addresses
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Mail** >> **Sender Addresses**.

These are the addresses that you can send email from.

The simplest configuration is to use a single sender address for all outgoing mail. This could be an address like support@, help@, contact@, or team@. In this configuration, you can still receive email from any number of mailboxes.

Alternatively, you may configure distinct sender addresses per department, team, project, subsidiary, or brand. Depending on your mail server, you may be restricted to a list of verified sender addresses. You may need to use a different mail transport per identity.

Each sender address has the following options:

- **Email:** The sender email address that recipients will see in the `From:` field (e.g. `support@example.com`).

- **Name:** The sender personal name that recipients will see in the `From:` field (e.g. `Support Team @ Example Inc.`).

- **Default signature:** The signature that will be automatically added to all outgoing messages from this sender when no other signature is specified.

- **Send mail using this transport:** The [mail transport](/docs/mail-transports) used to deliver messages from this sender.

- **Send HTML replies using this template:** An HTML layout and theme to use for messages sent from this sender.

- **Make default:** When this box is checked, this sender address will be used to send messages from all groups and buckets that don't specify their own sender.

(( SMTP server MAIL FROM auth ))

For optimal email deliverability, make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains. We'll test this a little later.

{% include setup_toc.html %}

# References

[^rbl-check]: <http://www.anti-abuse.org/multi-rbl-check/>