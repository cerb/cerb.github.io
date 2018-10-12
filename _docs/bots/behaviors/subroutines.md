---
title: Bot Behavior Subroutines
permalink: /docs/bots/behaviors/subroutines/
toc:
  title: Subroutines
jumbotron:
  title: Subroutines
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

**Subroutine** nodes allow you to create reusable _sub-behaviors_ that can be used any number of times by any action node in the behavior. A subroutine will never run on its own.

For instance, consider again the above example of our _"Schedule:"_ decision.  Perhaps in every outcome other than _"During office hours"_, and among other actions that justify splitting the outcomes, we want to send the same "out of office" auto-response to contacts who write in when we're not there.  A single subroutine would contain the _action_ node for sending the email message, and the four outcomes would each use it.  Any changes to that auto-response action would only need to be made in a single place.

Subroutine nodes can also use other subroutine nodes.