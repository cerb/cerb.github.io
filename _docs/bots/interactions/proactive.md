---
title: Proactive Bot Interactions
excerpt: 
permalink: /docs/bots/interactions/proactive/
toc:
  title: Proactive Interactions
jumbotron:
  title: Proactive Interactions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Interactions &raquo;
    url: /docs/bots/interactions/
---

Typically, workers initiate [interactions](/docs/bots/interactions/). **Proactive interactions** allow a [bot](/docs/bots/) to start an interaction with a [worker](/docs/workers/).

For instance, a bot may need to notify a worker about a monitoring alert, or show the current day’s schedule when a worker first logs in.

When a worker has at least one new proactive notification, an animated red message icon appears on the floating bot interaction button in the lower right of the browser. Opening the interaction menu will always first display any pending interactions.

<div class="cerb-screenshot">
<img src="/assets/images/releases/8.1/proactive-interaction-badge.png" class="screenshot">
</div>

Proactive interactions can be given an expiration date, and if a worker doesn’t start the interaction before that date then it will be dismissed automatically.

You can create proactive interactions with the **Schedule proactive interaction** [action](/docs/bots/behaviors/actions/) in any bot behavior.

<div class="cerb-screenshot">
<img src="/assets/images/releases/8.1/proactive-interaction.png" class="screenshot">
</div>