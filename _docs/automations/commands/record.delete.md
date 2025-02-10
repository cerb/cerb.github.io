---
title: 'Automations: record.delete'
excerpt: This page provides detailed information on the "record.delete" command used
  in Cerb automations.
summary: This page provides detailed information on the "record.delete" command used
  in Cerb automations. It explains the syntax and parameters required to delete a
  record of a specified type, such as "task," by providing the record type and ID.
  The page outlines the structure for inputs, outputs, and handling different scenarios
  like simulation, success, and error states. It describes how the output placeholder
  is used to store the dictionary of the deleted record or error messages, ensuring
  users can effectively manage record deletion within their automations.
permalink: /docs/automations/commands/record.delete/
toc:
  title: record.delete
  expand: Automations
jumbotron:
  title: record.delete
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **record.delete:** command deletes a record of the given type.

{% highlight cerb %}
{% raw %}
start:
  record.delete:
    output: results
    inputs:
      record_type: task
      record_id: 123
{% endraw %}
{% endhighlight %}

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
