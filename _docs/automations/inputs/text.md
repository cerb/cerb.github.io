---
title: "Automation Inputs: Text"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/inputs/text/
toc:
  title: Text
  expand: Automations
jumbotron:
  title: Text
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Inputs &raquo;
    url: /docs/automations/#inputs
---

<pre>
<code class="language-cerb">
inputs:
  text/email:
    required@bool: yes
    default: you@example.com
    type: email
</code>
</pre>

### required:

### default:

### type:

| Type | | Examples
|-|-|-
| `bool` | | `y`/`n`, `yes`/`no`, `on`/`off`, `true`/`false`, `0`/`1`
| `date` | | `noon Jan 20 2021`, `tomorrow 5pm`, `next Friday 8am`, `+2 days`
| `decimal` | | `3.1415`
| `email` | | `mailbox@host.example`
| `freeform` | | `This is a line of arbitrary text` (default)
| `geopoint` | | `44.284536706018905, 20.7861328125`
| `ip` | | `1.2.3.4` or `a1b2:c3d4:e5f6:a1b2:c3d4:e5f6:a1b2:c3d4`
| `ipv4` | | `1.2.3.4`
| `ipv6` | | `a1b2:c3d4:e5f6:a1b2:c3d4:e5f6:a1b2:c3d4`
| `record_type` | | `ticket`
| `number` | | `1234`
| `timestamp` | | `1606526867`
| `uri` | | `some-resource-name`
| `url` | | `https://cerb.ai/`
