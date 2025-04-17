---
title: 'Metrics: Mail Transport Deliveries'
excerpt: This page provides examples and details on the mail.transport.deliveries metric
permalink: /docs/metrics/mail.transport.deliveries/
toc:
  title: mail.transport.deliveries
jumbotron:
  title: mail.transport.deliveries
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

This metric tracks the number succesful messages sent through each [mail transport](docs/setup/mail/transports/), as well as each address within them over time. You can see which transport and addresses are your most active and which are the least.

# Dimensions

| Dimension    | Description                                       |
|--------------|---------------------------------------------------|
| transport_id | The mail transport records                        |
| sender_id    | The senders (email addresses) that send each mail |

