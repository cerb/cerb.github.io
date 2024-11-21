---
title: 'Automations: var.set'
excerpt: This page provides detailed information on the "var.set" command used in
  Cerb automations, which allows setting a value using a specified key path.
summary: This page provides detailed information on the "var.set" command used in
  Cerb automations, which allows setting a value using a specified key path. It includes
  a practical example demonstrating how to set and retrieve values using key paths,
  resulting in the output "Kina Halpue." The page outlines the syntax for the command,
  including required and optional inputs such as key, value, and delimiter. It also
  describes the optional sections for handling output, simulation, success, and error
  scenarios, providing a comprehensive guide for implementing the "var.set" command
  effectively in automation workflows.
permalink: /docs/automations/commands/var.set/
toc:
  title: var.set
  expand: Automations
jumbotron:
  title: var.set
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **var.set:** command sets a value using a key path.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    person:
      name:
        first: Kina
  var.set:
    inputs:
      key: person:name:last
      value: Halpue
  return:
    output@text:
      {{person.name.first}} {{person.name.last}}
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output: Kina Halpue
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | √ | The [key path](/docs/automations/#dictionaries) of the value to set, delimited with colons (`:`).
| `value:` | √ | The value to set.
| `delimiter:` |  | An optional delimiter to use in `key:` paths.

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of setting the value.

If omitted, the value is set during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set to the new value.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.