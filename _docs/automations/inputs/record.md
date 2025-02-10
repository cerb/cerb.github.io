---
title: 'Automation Inputs: Record'
excerpt: This page provides detailed information on configuring automation inputs
  for a record in Cerb, specifically focusing on tickets.
summary: This page provides detailed information on configuring automation inputs
  for a record in Cerb, specifically focusing on tickets. It outlines the necessary
  parameters such as 'required', 'record_type', 'default', and 'expand'. The 'required'
  parameter indicates whether the input is mandatory, while 'record_type' specifies
  the type of record, in this case, a ticket. The 'default' parameter allows setting
  a default value if none is provided. The 'expand' parameter is used to specify which
  keys should be expanded in the record dictionary, allowing for more detailed data
  retrieval. The page also explains the format for input values, which can be a record
  ID or a URI.
permalink: /docs/automations/inputs/record/
toc:
  title: Record
  expand: Automations
jumbotron:
  title: Record
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Inputs &raquo;
    url: /docs/automations/#inputs
---

{% highlight cerb %}
inputs:
  record/ticket:
    required@bool: yes
    record_type: ticket
    expand: owner_,customfields
    #default: 1
{% endhighlight %}

The value should be a record ID (`123`) or URI (`cerb:record_type:record_alias`).

### required:

### record_type:

[record types](/docs/records/types/)

### default:

The default for the input if a value is omitted.

### expand:

A comma-separated string or array of keys to expand in the record dictionary.