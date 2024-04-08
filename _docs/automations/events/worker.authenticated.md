---
title: "worker.authenticated"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/worker.authenticated/
toc:
  title: worker.authenticated
  expand: Automations
jumbotron:
  title: worker.authenticated
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Events &raquo;
    url: /docs/automations/#events
---

**worker.authenticated** [automations](/docs/automations/) are triggered when a [worker](/docs/workers/) successfully logs in.

This trigger uses [event handler](/docs/automations/#events) KATA, and all enabled automations are executed.

# Placeholders

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key                       | Type       | Notes                                                                                             |
|---------------------------|------------|---------------------------------------------------------------------------------------------------|
| `inputs`                  | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.                                 |
| `client_browser_name`     | string     | The client browser name (e.g. Safari).                                                            |
| `client_browser_platform` | string     | The client browser platform (e.g. Macintosh).                                                     |
| `client_browser_version`  | string     | The client browser version.                                                                       |
| `client_ip`               | string     | The client IP address.                                                                            |
| `worker_*`                | record     | The [worker](/docs/records/types/worker/#dictionary-placeholders) record. Supports key expansion. |

# Outputs

## return:

|---
| Key |
|-|-
| `deny:` | If defined, the worker login is denied with the given error message. For instance, combine this with an approved list of known client IPs, or reject very old browser versions.
