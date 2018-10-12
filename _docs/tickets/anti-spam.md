---
title: Email Anti-Spam
permalink: /docs/tickets/anti-spam/
toc:
  title: Anti-Spam
jumbotron:
  title: Anti-Spam
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Tickets &raquo;
    url: /docs/tickets/
---

Cerb performs a simple statistical analysis of the contents of the first message on new [tickets](/docs/tickets/) to predict whether a message is spam or not.

The predicted probability of being spam is stored as a **spam score** on the ticket.

By itself, this prediction has no effect on tickets. However, the computed score can be used by [bots](/docs/bots/) and [workers](/docs/workers/) to filter mail when desirable.

The spam predictions improve and adapt over time through training.  When a worker replies to a client message, Cerb learns to be more approving of similar messages in the future.

When workers click the **Report spam** button on a ticket, Cerb becomes more critical of similar messages in the future.