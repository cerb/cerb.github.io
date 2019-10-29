---
title: >-
  Bot Action: Set links
permalink: /docs/bots/events/actions/set_links/
toc:
  expand: Bots
jumbotron:
  title: >-
    Set links
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
| **Identifier (ID):** | set_links
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `on` | placeholder | The placeholder/variable containing the target record
|  | `is_remove` | bit | `0` (add links), `1` (remove links)
| **x** | `context_objects` | array | An array of `record_type:record_id` pairs to link to the target
