---
title: "Automations: storage.set"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/storage.set/
toc:
  title: storage.set
  expand: Automations
jumbotron:
  title: storage.set
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

The **storage.set:** command saves a value to long-term storage. This key/value can be shared between automations and invocations.

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
| `key:` | √ | The storage key to save. This is an arbitrary identifier.
| `value:` | √ | The value to for the storage key.
| `expires:` | | The optional date/time to expire the key (e.g. `+2 hours`, `31 Dec 2036`). Omit to not expire.

## output:

The optional placeholder to store the result.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of saving the storage key.

If omitted, the storage key is set during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The optional `output:` placeholder is set to a dictionary with these keys:

| Key |
|-|-
| `key` | The key which was set.
| `expires` | The optional expiration of the key.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.