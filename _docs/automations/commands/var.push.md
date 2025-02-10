---
title: 'Automations: var.push'
excerpt: This page provides detailed information on the "var.push" command used in
  Cerb automations, which appends a value to an array.
summary: This page provides detailed information on the "var.push" command used in
  Cerb automations, which appends a value to an array. It includes a practical example
  demonstrating how to append a value to an existing array and the resulting output.
  The page outlines the syntax for using "var.push," including required inputs such
  as the key path and value to append, and optional outputs for storing results. It
  also describes additional commands that can be executed during simulation, on success,
  and on error, with specific placeholders for handling errors. This documentation
  is essential for users looking to understand and implement the "var.push" command
  effectively in their automation workflows.
permalink: /docs/automations/commands/var.push/
toc:
  title: var.push
  expand: Automations
jumbotron:
  title: var.push
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **var.push:** command appends a value to an array.

{% highlight cerb %}
{% raw %}
start:
  set:
    numbers@csv: 1,2,3,4
  var.push:
    output: result
    inputs:
      key: numbers
      value: 5
  return:
    output@text:
      {{numbers|join(', ')}}
      {{result|json_encode}}
{% endraw %}
{% endhighlight %}

Result:

{% highlight cerb %}
output@text:
  1, 2, 3, 4, 5
  ["1","2","3","4","5"]
{% endhighlight %}

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | √ | The [key path](/docs/automations/#dictionaries) of the value to append to, delimited with colons (`:`).
| `value:` | √ | The value to append.

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of appending the value.

If omitted, the value is appended during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set to the new array after appending.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
