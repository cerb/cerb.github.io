---
title: >-
  Bot Action: Set custom placeholder
permalink: /docs/bots/events/actions/_set_custom_var/
toc:
  expand: Bots
jumbotron:
  title: >-
    Set custom placeholder
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
| **Identifier (ID):** | _set_custom_var
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `var` | placeholder | The placeholder to set
| **x** | `value` | string | The new value of the placeholder
|  | `format` | string | The format of the value: `json`, or omit for text
|  | `is_simulator_only` | bit | Only set the placeholder in simulator mode: `0`=no, `1`=yes
