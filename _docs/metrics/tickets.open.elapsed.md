---
title: 'Metrics: Tickets Open Elapsed'
excerpt: This page provides examples and details on the tickets.open.elapsed metric
permalink: /docs/metrics/tickets.open.elapsed/
toc:
  title: tickets.open.elapsed
jumbotron:
  title: tickets.open.elapsed
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Metrics &raquo;
    url: /docs/metrics/
---

* TOC
{:toc}

# Description

Knowing how long a ticket sits in the `Open` status is important information. After all, if a ticket is in the open status, that means a customer is waiting for a response. Knowing how long a ticket spends open in general is useful knowledge, but it is more important to know how long tickets spend open per group or bucket. That way you can discover any potential bottlenecks or places where performance needs improving. That's where the `tickets.open.elapsed` metric comes in.

In the past, `time spent open` was a single entry on a ticket and was applied to whatever group or bucket the ticket currently resided. This could lead to report results that painted an incorrect picture. If a ticket were to sit in Triage for a day before being handed off to the Bugs team, who responds in five minutes, simply saying that the ticket was open for a day and five minutes does not show you the full picture.

The `tickets.open.elapsed` metric samples whenever a ticket is moved to a different group/bucket or when the ticket moves to a non-open status (eg `waiting` or `closed`). In our above example, the ticket sits in Triage for a day. Upon moving to the Bug team, the metric is sampled and one day is added to the Triage group. Then, the Bug team responds in five minutes and the ticket is closed. The metric is sampled again, this time adding five minutes to the Bug team. Now you have the proper information needed to investigate why Triage is taking a full day to process tickets, not why the Bug team is taking over a day to respond to them.

This can also be useful if a ticket spends time somewhere that extended waits are expected, such as "developer help" bucket that is only checked once per week. In this case, a Support team, for example, is not penalized for time the ticket is outside of their control.

# Dimensions

| Dimension | Description                     |
|-----------|---------------------------------|
| group_id  | The IDs of the relevant groups  |
| bucket_id | The IDs of the relevant buckets |
