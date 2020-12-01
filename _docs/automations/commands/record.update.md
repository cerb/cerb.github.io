---
title: "Automations: record.update"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/record.update/
toc:
  title: record.update
  expand: Automations
jumbotron:
  title: record.update
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

{% include docs/note_preview.html %}

The **record.update:** command updates an existing record with the given fields.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.update:
    output: updated_record
    inputs:
      record_type: task
      record_id: 123
      # See: https://cerb.ai/docs/records/types/task/#records-api
      fields:
        importance: 90
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to update.
| `record_id:` | The ID of the given record type to update.
| `fields:` | The [fields](/docs/records/#fields) to set based on the record type.

## output:

Save the record dictionary to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of updating the record.

If omitted, the record is updated during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is a dictionary based on the record type.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.