---
title: Bot Behavior Events
permalink: /docs/bots/behaviors/events/
toc:
  title: Events
jumbotron:
  title: Events
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

Each bot [behavior](/docs/bots/behaviors/) is triggered in response to a specific **event**. There are dozens of built-in events, and plugins or [webhooks](/docs/webhooks) can introduce new events for nearly anything.

Events can be grouped into two categories:

- **Autonomous** events occur automatically in response to normal activity within Cerb, even if nobody is logged in: a new message is received, a comment is made, a particular set of fields change on a record, etc.

- **Interactive** events are initiated by an actor (worker, bot, webhook) with an exchange of information between the bot and the actor. This includes conversational behaviors, as well as behaviors that serve as shortcuts for repeating a sequence of actions when directly instructed.
