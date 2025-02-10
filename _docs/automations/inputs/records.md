---
title: 'Automation Inputs: Records'
excerpt: This page provides detailed information on configuring automation inputs
  for records in Cerb.
summary: This page provides detailed information on configuring automation inputs
  for records in Cerb. It explains how to define inputs for records, specifying whether
  they are required, the type of records, and default values if inputs are omitted.
  Additionally, it describes the use of the 'expand' option, which allows for the
  expansion of specific keys in the record dictionaries. The page is intended for
  users looking to set up or customize automation inputs by specifying record IDs
  or URIs, with a focus on address record types.
permalink: /docs/automations/inputs/records/
toc:
  title: Records
  expand: Automations
jumbotron:
  title: Records
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
  records/participants:
    required@bool: yes
    record_type: address
    expand: owner_,customfields
    #default@csv: 1,2,3
{% endhighlight %}

The value should be an array of record IDs (`123`) or URIs (`cerb:record_type:record_alias`).

### required:

### record_type:

[record types](/docs/records/types/)

### default:

The default for the input if a value is omitted.

### expand:

A comma-separated string or array of keys to expand in the record dictionaries.
