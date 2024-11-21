---
title: 'Automations: record.get'
excerpt: This page provides detailed information on the "record.get" command used
  in Cerb automations to load a record based on a specified type and ID.
summary: This page provides detailed information on the "record.get" command used
  in Cerb automations to load a record based on a specified type and ID. It outlines
  the syntax and structure of the command, including the necessary inputs such as
  `record_type` and `record_id`, and the expected output. The page also explains the
  optional parameters like `on_simulate`, `on_success`, and `on_error`, which define
  the actions to take during simulation, upon successful execution, or in case of
  an error, respectively. The example provided demonstrates how to load a task record
  and format the output message.
permalink: /docs/automations/commands/record.get/
toc:
  title: record.get
  expand: Automations
jumbotron:
  title: record.get
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **record.get:** command loads a record from a [type](/docs/records/types/) and ID. 

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.get:
    output: record
    inputs:
      record_type: task
      record_id: 123
  return:
    output@text:
      Loaded {{record._context}} #{{record.id}}: {{record._label}}
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
output: Loaded cerberusweb.contexts.task #123: Install Cerb
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to load.
| `record_id:` | The ID of the given record type to load.

## output:

Save the record dictionary to this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of loading the record.

If omitted, the record will be loaded during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The dictionary of the loaded record is saved to the `output:` placeholder.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
