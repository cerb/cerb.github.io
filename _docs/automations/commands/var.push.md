---
title: "Automations: var.push"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/var.push/
toc:
  title: var.push
  expand: Automations
jumbotron:
  title: var.push
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

The **var.push:** command appends a value to an array.

<pre>
<code class="language-cerb">
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
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output:
  1, 2, 3, 4, 5
  ["1","2","3","4","5"]
</code>
</pre>

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
