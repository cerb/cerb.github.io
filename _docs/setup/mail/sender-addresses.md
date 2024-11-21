---
title: 'Setup: Sender Addresses'
excerpt: This page provides guidance on setting up sender addresses for outgoing emails
  in Cerb.
summary: This page provides guidance on setting up sender addresses for outgoing emails
  in Cerb. It explains the simplest configuration of using a single sender address
  for all outgoing mail, such as `support@` or `contact@`, while still being able
  to receive emails from multiple mailboxes. It also discusses the option of configuring
  distinct sender addresses for different departments, teams, projects, subsidiaries,
  or brands, and notes that mail server restrictions may require a list of verified
  sender addresses or different mail transports per identity. The page emphasizes
  the importance of configuring SPF, DKIM, and DMARC records in DNS for all sender
  domains to ensure optimal email deliverability.
permalink: /docs/setup/mail/sender-addresses/
toc:
  expand: Admin Guide
jumbotron:
  title: Sender Addresses
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Mail &raquo;
    url: /docs/setup/#outgoing-mail
---

These are the email addresses that will appear in `From:` when you send messages.

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/sender_addresses.png" class="screenshot">
</div>

The simplest configuration is to use a single sender address for all outgoing mail. This could be an address like `support@`, `help@`, `contact@`, or `team@`. In this configuration, you can still receive email from any number of mailboxes.

Alternatively, you may configure distinct sender addresses per department, team, project, subsidiary, or brand. Depending on your mail server, you may be restricted to a list of verified sender addresses. You may need to use a different mail transport per identity.

For optimal email deliverability, make sure you've configured SPF, DKIM, and DMARC records in DNS for all sender domains.

# References

[^rbl-check]: <http://www.anti-abuse.org/multi-rbl-check/>

[^signatures]: <https://en.wikipedia.org/wiki/Signature_block>
