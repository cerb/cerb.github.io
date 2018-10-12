---
title: Email Response Times
permalink: /docs/tickets/response-times/
toc:
  title: Response Times
jumbotron:
  title: Response Times
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Tickets &raquo;
    url: /docs/tickets/
---

Cerb records **response time** information in two fields:

- **First response**: the total time elapsed before the first response from a worker. This focuses on the first response so that it isn't skewed by later delays that may be attributed to the client.

- **First resolution**: the total time elapsed before the ticket was first changed to the _closed_ status. This isn't affected by subsequent changes between the _open_ and _closed_ statuses that may occur when you get stuck in a loop of _"Thanks!"_ and _"You're welcome!"_ -- especially because that may occur days after the ticket was actually resolved.

When a worker responds to a specific client message, Cerb also records the response time on the worker's message. This encourages workers to respond quickly, even if it's only to say, _"Let me check on that and get right back to you"._
