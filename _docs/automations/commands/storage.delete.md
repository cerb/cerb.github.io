---
title: "Automations: storage.delete"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/storage.delete/
toc:
  title: storage.delete
  expand: Automations
jumbotron:
  title: storage.delete
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

The **storage.delete:** command removes a value from long-term storage.

<pre>
<code class="language-cerb">
{% raw %}
start:
  storage.set:
    inputs:
      key: some.arbitrary.identifier
      value: This is the saved value.
  storage.delete:
    inputs:
      key: some.arbitrary.identifier
  storage.get:
    output: result
    inputs:
      key: some.arbitrary.identifier
    on_error:
      set:
        result@json: null
  return:
    output@key: result
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output: (null)
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | √ | The storage key to delete. This is an arbitrary identifier.

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of deleting the storage key.

If omitted, the storage key is deleted during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set `true` if successful and `false` otherwise.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.