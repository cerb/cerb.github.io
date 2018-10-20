---
title: Security
permalink: /docs/setup/configure/security/
excerpt: Configure security settings like session expiration and the IP whitelist.
toc:
  expand: Setup
jumbotron:
  title: Security
  breadcrumbs:
  - 
    label: Docs &raquo;
    url: /docs/home/
  - 
    label: Setup &raquo;
    url: /docs/setup/
  - 
    label: Configure &raquo;
    url: /docs/setup/configure/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/security.png" class="screenshot">
</div>

### Remote Administration

This section configures the _whitelist_ of IPs that are able to access the `/debug` and `/cron` pages without a session.

### Session Expiration

This section determines the lifespan of [session](/docs/setup/sessions/) cookies.  When a session expires, a worker will need to log in again from that particular device.
