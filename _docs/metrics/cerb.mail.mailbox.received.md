---
title: 'Metrics: Mailbox Messages Received'
excerpt: This page provides examples and details on the cerb.mail.mailbox.received metric
permalink: /docs/metrics/cerb.mail.mailbox.received/
toc:
  title: cerb.mail.mailbox.received
jumbotron:
  title: cerb.mail.mailbox.received
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Metrics &raquo;
    url: /docs/metrics/
search_index:
  exclude: true
---

* TOC
{:toc}

# Description

This counter tracks messages downloaded from each [mailbox](/docs/records/types/mailbox/).

Use it to confirm a mailbox is still receiving mail, compare volume between mailboxes, or spot a mailbox that has gone quiet unexpectedly.

It also backs the `usage:` quick search filter and the 'Usage' sparklines column on mailbox [worklists](/docs/worklists/) -- for instance, `usage:(received:>0 since:today)` returns mailboxes that pulled mail today.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| mailbox_id | The [mailbox](/docs/records/types/mailbox/) the messages were downloaded from |

# Related

See also [cerb.mail.mailbox.errors](/docs/metrics/cerb.mail.mailbox.errors/) for protocol failures on the same mailboxes.
