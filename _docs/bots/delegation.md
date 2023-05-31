---
title: Bot Delegation
permalink: /docs/bots/delegation/
toc:
  title: Delegation
jumbotron:
  title: Delegation
  #tagline: ...
  breadcrumbs:
  -
    label: Bots &raquo;
    url: /docs/bots/
---

A bot can run and schedule behaviors on other bots. When a bot provides behaviors as a service to other bots, we call it a **delegate**.

We highly recommend creating delegates for interacting with services (e.g. Twitter, Twilio, Facebook), since you'll only have to build and maintain those behaviors in a single place.

When using a [connected account](/docs/connected-accounts/) to authenticate against an API, delegates also protect your credentials and restrict the types of requests that can be made.

