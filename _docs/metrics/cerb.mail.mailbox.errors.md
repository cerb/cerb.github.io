---
title: 'Metrics: Mailbox Errors'
excerpt: This page provides examples and details on the cerb.mail.mailbox.errors metric
permalink: /docs/metrics/cerb.mail.mailbox.errors/
toc:
  title: cerb.mail.mailbox.errors
jumbotron:
  title: cerb.mail.mailbox.errors
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

This counter tracks protocol errors when checking each [mailbox](/docs/records/types/mailbox/), broken down by error status code.

Use it to catch a mailbox whose credentials have expired or whose host has changed -- the status dimension distinguishes an authentication failure from a connection problem.

It also backs the `usage:` quick search filter on mailbox [worklists](/docs/worklists/) -- for instance, `usage:(errors:>0)` returns mailboxes that have ever had an error.

# Dimensions

| Dimension | Description                                                  |
|-----------|--------------------------------------------------------------|
| mailbox_id | The [mailbox](/docs/records/types/mailbox/) that failed |
| status    | The error status code (e.g. invalid authentication) |

# Related

See also [cerb.mail.mailbox.received](/docs/metrics/cerb.mail.mailbox.received/) for successful downloads.
