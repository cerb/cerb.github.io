---
title: 'Metrics: Mail Transport Failures'
excerpt: This page provides examples and details on the mail.transport.failures metric
permalink: /docs/metrics/mail.transport.failures/
toc:
  title: mail.transport.failures
jumbotron:
  title: mail.transport.failures
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

This metric tracks the number of messages send failures occur for each [mail transport](docs/setup/mail/transports/), as well as each address within them. This way, you can easily spot any malfunctioning senders or transports. If you have reports of messages failing to send, this is the metric to check.

# Dimensions

| Dimension    | Description                                       |
|--------------|---------------------------------------------------|
| transport_id | The mail transport records                        |
| sender_id    | The senders (email addresses) that send each mail |

