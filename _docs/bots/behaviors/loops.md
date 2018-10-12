---
title: Bot Behavior Loops
permalink: /docs/bots/behaviors/loops/
toc:
  title: Loops
jumbotron:
  title: Loops
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

A **loop** node repeats every node inside of it for a certain number of _iterations_.

For instance, assume that you just loaded a list of tweets that @mention your company's Twitter account using an _action_ node.  You now need to scan through each tweet to see if the username matches a contact record in your address book (stored in a custom field).  You can use a _loop_ node to iterate through each tweet and run [decisions](/docs/bots/behaviors/decisions/), [outcomes](/docs/bots/behaviors/decisions/), and [actions](/docs/bots/behaviors/actions/) against them.

You can do the same thing with records loaded from a worklist by an _action_.

It's also possible to just loop a specific number of times without being based on anything.

In conversational bot behaviors, loops are a simple way to validate user input and prompt them to make corrections when necessary.

## Related resources

* [Guide: Break out of a loop in a bot behavior](/guides/bots/break-loop-in-bots/)
