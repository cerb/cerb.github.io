---
title: "Automation Inputs: Records"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/inputs/records/
toc:
  title: Records
  expand: Automations
jumbotron:
  title: Records
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
  records/participants:
    required@bool: yes
    record_type: address
    expand: owner_,customfields
    #default@csv: 1,2,3
</code>
</pre>

The value should be an array of record IDs (`123`) or URIs (`cerb:record_type:record_alias`).

### required:

### record_type:

[record types](/docs/records/types/)

### default:

The default for the input if a value is omitted.

### expand:

A comma-separated string or array of keys to expand in the record dictionaries.
