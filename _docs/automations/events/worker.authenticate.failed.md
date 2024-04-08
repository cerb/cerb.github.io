---
title: "worker.authenticate.failed"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/worker.authenticate.failed/
toc:
  title: worker.authenticate.failed
  expand: Automations
jumbotron:
  title: worker.authenticate.failed
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

**worker.authenticate.failed** [automations](/docs/automations/) are triggered when a [worker](/docs/workers/) login fails to authenticate (e.g. invalid password).

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

(none)

