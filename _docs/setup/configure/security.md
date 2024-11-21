---
title: Security
excerpt: Configure security settings like session expiration and the IP allowlist.
summary: This page provides information on security configurations for Cerb, specifically
  focusing on remote administration and session expiration. It details how to set
  up an allowlist of IP addresses that can access the `/debug` and `/cron` pages without
  requiring a session, enhancing security by restricting access to these sensitive
  areas. Additionally, it explains how to configure the lifespan of session cookies,
  ensuring that sessions expire after a certain period, which requires users to log
  in again from their devices, thereby maintaining secure access control.
permalink: /docs/setup/configure/security/
toc:
  expand: Admin Guide
jumbotron:
  title: Security
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Configure &raquo;
    url: /docs/setup/#configure
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/security.png" class="screenshot">
</div>

### Remote Administration

This section configures the _allowlist_ of IPs that are able to access the `/debug` and `/cron` pages without a session.

### Session Expiration

This section determines the lifespan of [session](/docs/setup/sessions/) cookies.  When a session expires, a worker will need to log in again from that particular device.
