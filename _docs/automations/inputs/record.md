---
title: "Automation Inputs: Record"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/inputs/record/
toc:
  title: Record
  expand: Automations
jumbotron:
  title: Record
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
  record/ticket:
    required@bool: yes
    record_type: ticket
    expand: owner_,customfields
    #default: 1
</code>
</pre>

The value should be a record ID (`123`) or URI (`cerb:record_type:record_alias`).

### required:

### record_type:

[record types](/docs/records/types/)

### default:

The default for the input if a value is omitted.

### expand:

A comma-separated string or array of keys to expand in the record dictionary.