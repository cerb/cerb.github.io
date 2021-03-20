---
title: "Automations: record.upsert"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/record.upsert/
toc:
  title: record.upsert
  expand: Automations
jumbotron:
  title: record.upsert
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

The **record.upsert:** command creates or updates a record with the given fields.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.upsert:
    output: record
    inputs:
      record_type: task
      record_query: name:"This is a new task" status:open
      # See: https://cerb.ai/docs/records/types/task/#records-api
      fields:
        importance: 75
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to create.
| `record_query:` | The [search query](/docs/search/) to match. With `0` matches the record is created. With `1` match the existing record is updated. The [on_error:](#on_error) event is triggered otherwise.
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