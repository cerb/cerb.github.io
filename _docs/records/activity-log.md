---
title: Activity Log
permalink: /docs/activity-log/
jumbotron:
  title: Activity Log
  tagline: An auditable history of past record events
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
---

The **activity log** maintains an auditable history of past events that have affected [records](/docs/records/).

Each activity log record includes:

|---
| Field | Description
|-|-
| Timestamp | The date and time (to the second) when the event took place. 
| Activity | The event that took place (e.g. comment, record deletion, failed login).
| Actor | The worker, contact, or bot who performed the event (if applicable).
| Target | The record that was affected by the event.

<div class="cerb-screenshot">
<img src="/assets/images/docs/using-cerb/records/log.png" class="screenshot">
</div>
