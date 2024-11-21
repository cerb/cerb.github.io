---
title: 'Automations: var.expand'
excerpt: This page provides detailed information on the `var.expand` command used
  in Cerb automations.
summary: This page provides detailed information on the `var.expand` command used
  in Cerb automations. It explains how to expand nested keys at a specified dictionary
  path within automation scripts. The page includes syntax details for the command,
  outlining required and optional keys such as `key` and `paths`, and describes how
  to handle different scenarios with `on_simulate`, `on_success`, and `on_error` commands.
  An example is provided to illustrate the command's functionality, showing how to
  extract and format data from a dictionary. The page serves as a guide for users
  looking to implement or understand the `var.expand` command in their automation
  workflows.
permalink: /docs/automations/commands/var.expand/
toc:
  title: var.expand
  expand: Automations
jumbotron:
  title: var.expand
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **var.expand:** command expands nested keys at a given dictionary path.

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  records/tickets:
    record_type: ticket
    required@bool: yes

start:
  var.expand:
    inputs:
      key: inputs:tickets
      paths: owner_,customfields
  return:
    owners@json: {{array_column(inputs.tickets,'owner__label','_label')|json_encode}}
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-yaml">
owners:
  '[#ANB-75367-518] Always use HTML mode on replies': Kina Halpue
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | | The [key path](/docs/automations/#dictionaries) to expand, delimited with colons (`:`). This must be a dictionary or an array of dictionaries. When omitted, key expansion happens in the root dictionary
| `paths:` | √ | The paths to expand at the given dictionary keys.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of expanding the key.

If omitted, the value is appended during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
