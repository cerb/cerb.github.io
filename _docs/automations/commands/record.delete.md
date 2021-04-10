---
title: "Automations: record.delete"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/record.delete/
toc:
  title: record.delete
  expand: Automations
jumbotron:
  title: record.delete
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

The **record.delete:** command deletes a record of the given type.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.delete:
    output: results
    inputs:
      record_type: task
      record_id: 123
{% endraw %}
</code>
</pre>

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to delete.
| `record_id:` | The ID of the given record type to delete.

## output:

The dictionary of the deleted record will be saved to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of deleting the record.

If omitted, the record is deleted during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is set to the dictionary of the deleted record.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
