---
title: "Automations: var.unset"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/var.unset/
toc:
  title: var.unset
  expand: Automations
jumbotron:
  title: var.unset
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

The **var.unset:** command removes a placeholder using a key path.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    person:
      name:
        first: Kina
        last: Halpue
      phone: +15551234321
  var.unset:
    inputs:
      key: person:phone
  return:
    person@key: person
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
person:
  name:
    first: Kina
    last: Halpue
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | √ | The [key path](/docs/automations/#dictionaries) of the value to unset, delimited with colons (`:`).

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of unsetting the value.

If omitted, the value is not unset during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set to `true` if the key was found, and `false` otherwise.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.