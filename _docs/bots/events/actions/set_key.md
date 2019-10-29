---
title: >-
  Bot Action: Set persistent key
permalink: /docs/bots/events/actions/_set_key/
toc:
  expand: Bots
jumbotron:
  title: >-
    Set persistent key
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: Actions &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Identifier (ID):** | _set_key
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `key` | string | The key to set in storage
| **x** | `value` | string | The value to set in storage
|  | `expires_at` | datetime | When to expire the key (e.g. `now`, `+2 days`, `Friday 8am`); omit to never expire
