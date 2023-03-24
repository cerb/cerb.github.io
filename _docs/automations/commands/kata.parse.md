---
title: "Automations: kata.parse"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/kata.parse/
toc:
  title: kata.parse
  expand: Automations
jumbotron:
  title: kata.parse
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

The **kata.parse:** command parses an arbitrary [KATA](/docs/kata/) document with placeholder substitution.

<pre>
<code class="language-cerb">
{% raw %}
start:
  kata.parse:
    inputs:
      kata@raw:
        template@text:
          Hello {{name}}! Thanks for writing to {{company}}.
      dict:
        name: Janey
        company: Cerb
    output: results

  return:
    output: {{results.template}}
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

### kata:

A [KATA](/docs/kata/) document to parse. This will generally use the [@raw](/docs/kata/#raw) annotation to prevent placeholders from being substituted by the automation prior to execution.

### dict:

A dictionary of keys/values for placeholders.

### schema:

A validation schema for the KATA document. This is useful if the document is dynamically generated or user-provided.

<pre>
<code class="language-cerb">
{% raw %}
  schema:
    attributes:
      automation:
        multiple@bool: yes
        types:
          object:
            attributes:
              uri:
                required@bool: yes
                types:
                  string:
              disabled:
                types:
                  bool:
              inputs:
                types:
                  list:
{% endraw %}
</code>
</pre>

#### Keys

| Option |
|-|-
| `multiple@bool:` | The key may appear multiple times as siblings. Default `no`.
| `required@bool:` | The key must be defined in the document. Default `no`.
| `types:` | One or more types that describe acceptable values for the key.

#### types:

Each key in a KATA document must be of one or more data **types**.

| Type | Description
|-|-
| `array:` | An array of arbitrary keys/values.
| `bool:` | A `true` or `false` value.
| `list:` | A list of one or more values.
| `object:` | An object with nested `attributes:` of a given type.
| `text:` | An arbitrary text value.

The root of a schema is always of type `object:`.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of parsing the KATA document.

If omitted, the KATA document is parsed during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives a dictionary with the same structure as the KATA document.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
