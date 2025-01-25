---
title: Create a key expandable placeholder
excerpt: Create an arbitrary variable that supports key expansion by using a shared
  prefix.
summary: This page explains how to create key expandable placeholders in Cerb using
  a common prefix. By setting variables with `_context` and `id` suffixes, you can
  automatically create an expandable `_label` placeholder. This is useful for referencing
  record labels throughout your automations without explicitly loading each record.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/key-expandable-placeholder.png
---

{% comment %}
* Uses set: command to create paired context/id variables
* Automatically creates _label placeholder when both are set
* Works with any valid record type
* Common pattern for referencing records
{% endcomment %}

When you set both `{prefix}__context` and `{prefix}_id` variables using a common prefix, Cerb automatically creates a key expandable dictionary for the referenced record.

This is a shortcut for [record.get:](/docs/automations/commands/record.get/)

## Create a ticket dictionary

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
