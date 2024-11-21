---
title: Activity Log
excerpt: This page describes the activity log feature in Cerb, which provides an auditable
  history of events affecting records.
summary: This page describes the activity log feature in Cerb, which provides an auditable
  history of events affecting records. Each log entry includes details such as the
  timestamp of the event, the type of activity (e.g., comment, record deletion, failed
  login), the actor responsible (which could be a worker, contact, or bot), and the
  target record impacted by the event.
permalink: /docs/activity-log/
jumbotron:
  title: Activity Log
  tagline: An auditable history of past record events
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
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
