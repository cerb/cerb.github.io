---
title: "Automations: storage.get"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/storage.get/
toc:
  title: storage.get
  expand: Automations
jumbotron:
  title: storage.get
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

{% include docs/note_preview.html %}

The **storage.get:** command retrieves a previously saved value from long-term storage. This key/value can be shared between automations and invocations.

<pre>
<code class="language-cerb">
{% raw %}
start:
  storage.set:
    inputs:
      key: some.arbitrary.identifier
      value: This is the saved value.
      expires: +15 mins
  storage.get:
    output: result
    inputs:
      key: some.arbitrary.identifier
      default: This is a default value.
  return:
    output@key: result
{% endraw %}
</code>
</pre>

Result:

<pre>
<code class="language-cerb">
output: This is the saved value.
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | Req'd | 
|-|:-:|-
| `key:` | √ | The storage key to load. This is an arbitrary identifier.
| `default:` | | A default value to return when the storage key doesn't exist.

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of fetching the storage key.

If omitted, the storage key is fetched during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set to the value of the storage key.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.