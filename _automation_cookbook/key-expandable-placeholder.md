---
title: Create a key expandable placeholder
excerpt: Create an arbitrary variable that supports key expansion by using a shared prefix.
summary: "This page explains how to create key expandable placeholders in Cerb using a common prefix. By setting variables with `_context` and `id` suffixes, you can automatically create an expandable `_label` placeholder. This is useful for referencing record labels throughout your automations without explicitly loading each record."
layout: integration
jumbotron:
  title: Key expandable placeholder
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses set: command to create paired context/id variables
* Automatically creates _label placeholder when both are set
* Works with any valid record type
* Common pattern for referencing records
{% endcomment %}

## set:

When you set both `prefix__context` and `prefix_id` variables using a common prefix, Cerb automatically creates an expandable `prefix__label` placeholder for referencing the record.

**Create a ticket label placeholder:**

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    ticket__context: ticket
    ticket_id: 1
  return:
    output: {{ticket__label}}
{% endraw %}
</code>
</pre>
