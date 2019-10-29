---
title: "Setup: Sender Addresses"
permalink: /docs/setup/mail/sender-addresses/
toc:
  expand: Setup
jumbotron:
  title: Sender Addresses
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Mail &raquo;
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
