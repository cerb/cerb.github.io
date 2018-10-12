---
title: Bot Behavior Variables
permalink: /docs/bots/behaviors/variables/
toc:
  title: Variables
jumbotron:
  title: Variables
  #tagline: Powerful automated behaviors built from your web browser
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Behaviors &raquo;
    url: /docs/bots/behaviors/
---

While [dictionaries](/docs/bots/behaviors/dictionaries/) maintain the current state of a bot behavior, **variables** describe the behavior's inputs.

In the behavior's dictionary, variables are prefixed with `var_`. They can be used in outcomes and actions like any other placeholder.

When a variable is marked as **public**, its initial value may be set by the actor who triggers the behavior. This may be a human worker or another bot.

For example, if a behavior exists to send SMS messages through Twilio, one public variable can prompt for the message to send, and a second public variable can prompt for the mobile number of the recipient.

Conversely, a **private** variable does not prompt for input; its value is only set within the behavior itself.

Variables make it easy to create _reusable_ behaviors -- common functionality that is implemented in one place and used in many places.