---
title: Reminders
excerpt: 
permalink: /docs/reminders/
jumbotron:
  title: Reminders
  tagline: 
---

**Reminders** are scheduled messages to [workers](/docs/workers/) at a specific future date and time.

A reminder can be [linked](/docs/links/) to any number of [records](/docs/records/).

When a reminder is triggered, it may run any number of [bot](/docs/bots/) behaviors. These are typically different methods for contacting a worker depending on the urgency of the reminder (e.g. notification, email, mobile text message, Slack, etc).

<div class="cerb-screenshot">
<img src="/assets/images/docs/getting-started/reminder.png" class="screenshot">
</div>

## Related resources

{% comment %}
* [Guide: Creating a reminder](/guides/reminders/creating/)
{% endcomment %}
* [Package: Reminder Bot](/packages/reminder-bot/)