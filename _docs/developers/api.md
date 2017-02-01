---
title: API
permalink: /docs/api/
jumbotron:
  title: API
  tagline: Programmatically interact with Cerb from other apps and services
---

The REST-based[^rest] Web API[^api] provides the ability to remote control Cerb for automation, synchronization, and integration. For example, you can use the API from other applications and services to create tickets, search records, monitor notifications, manage tasks, and interact with [bots](/docs/bots/).

The API uses per-application credentials and per-worker permissions to authorize API requests. It supports returning data in XML or JSON.

# Topics

- [Credentials](/docs/api/topics/credentials/)
- [Authentication](/docs/api/topics/authentication/)
- [Requests](/docs/api/topics/requests/)
- [Responses](/docs/api/topics/responses/)
- [Custom Fields](/docs/api/topics/custom-fields/)

# Modules

{% for doc in site.docs %}{% assign path = doc.url|slice:0,18 %}{% if path == '/docs/api/modules/' %}- [{{doc.title}}]({{doc.url}})
{% endif %}{% endfor %}

# Libraries

- [PHP](/docs/api/libraries/php/)
- [Perl](/docs/api/libraries/perl/)
- [Node.js](/docs/api/libraries/nodejs/)
- [Apex](/docs/api/libraries/apex/)
- [Zapier](/docs/api/libraries/zapier/)

# References

[^api]: Wikipedia - <http://en.wikipedia.org/wiki/API>
[^rest]: Wikipedia - <http://en.wikipedia.org/wiki/REST>