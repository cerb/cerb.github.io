---
title: >-
  Bot Action: Execute email parser
permalink: /docs/bots/events/actions/core.bot.action.email_parser/
toc:
  expand: Bots
jumbotron:
  title: >-
    Execute email parser
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
| **Identifier (ID):** | core.bot.action.email_parser
| **Event:** | (All)

### Params

|---
| Req'd | Key | Type | Notes 
|:-:|-|-|-
| **x** | `message_source` | text | The raw email message (RFC-2822) to process
|  | `run_in_simulator` | bit | Run the email parser in the simulator: `0`=no, `1`=yes
|  | `response_placeholder` | placeholder | The placeholder to set with the email parser results
