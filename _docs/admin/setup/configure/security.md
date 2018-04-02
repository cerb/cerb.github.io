---
title: Security
permalink: /docs/setup/security/
excerpt: Configure security settings like session expiration and the IP whitelist.
jumbotron:
  title: Security
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Configure** >> **Security**

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/security.png" class="screenshot">
</div>

### Remote Administration

This section configures the _whitelist_ of IPs that are able to access the `/debug` and `/cron` pages without a session.

### Session Expiration

This section determines the lifespan of [session](/docs/setup/sessions/) cookies.  When a session expires, a worker will need to log in again from that particular device.

{% include setup_toc.html %}