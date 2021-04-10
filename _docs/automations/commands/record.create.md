---
title: "Automations: record.create"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/record.create/
toc:
  title: record.create
  expand: Automations
jumbotron:
  title: record.create
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

The **record.create:** command creates a record with the given fields.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.create/newTask:
    output: new_task
    inputs:
      # See: https://cerb.ai/docs/records/types/task/#records-api
      record_type: task
      fields:
        title: This is a new task
        status: open
        importance: 50
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
| `fields:` | The [fields](/docs/records/#fields) to set based on the record type.
| `expand:` | The keys to expand on the `output:` dictionary.

## output:

Save the record dictionary to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of creating the record.

If omitted, the record is created during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is a dictionary based on the record type.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
