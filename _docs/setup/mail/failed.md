---
title: Failed Messages
permalink: /docs/setup/mail/failed/
toc:
  title: Failed Messages
  expand: Setup
jumbotron:
  title: Failed Messages
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Mail &raquo;
    url: /docs/setup/#incoming-mail
---

In most cases, Cerb processes new inbound email messages in a fraction of a second without any issues.

In some rare situations, Cerb may run into trouble when processing a specific message.  For instance:

- The message is malformed or lacks required information (e.g. no sender).
- The message requires too much memory to process.
- The message requires too much execution time to process.
- Cerb was interrupted while processing the message (e.g. power outage, hardware failure).
- The server's configuration changed and some requirements are no longer met (e.g. PHP upgrade without reinstalling the mailparse extension).

Cerb is carefully designed to not lose email in any of these situations.

A message is first downloaded from a [mailbox](/docs/setup/mailboxes/) into the `storage/mail/new/` directory.  When Cerb first starts processing a message it is moved to the `storage/mail/fail/` directory.  If the message is successfully processed then the file is removed.  Otherwise, the file remains in a failed state.

This is important, because some failures don't give Cerb an opportunity to react to them after the fact.  This also prevents a message that repeatedly fails from blocking all subsequent incoming mail.

This page allows you to review failed messages.  You can retry them from the worklist and receive more detailed error logging for any issues.
