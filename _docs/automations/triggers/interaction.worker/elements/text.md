---
title: "Text - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/text/
toc:
  title: Text
  expand: Automations
jumbotron:
  title: Text
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **text** element displays a text input field with various validation options.

Formats: date, decimal, bool, email, ip, geopoint, number, record type, timestamp, uri, url

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        text/prompt_name:
          label: Name:
          required@bool: yes
          type: freeform
        text/prompt_email:
          label: Email:
          required@bool: yes
          type: email
          placeholder: you@example.com
        text/prompt_website:
          label: Website:
          required@bool: yes
          type: url
          placeholder: https://website.example
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/text.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### type:

Default: `freeform`

|Type|Examples
|-|-
|`bool`| `true`, `false`
|`date`| `tomorrow 8am`, `next Friday`, `31 Dec 2025 noon`
|`decimal`| `3.1415`
|`email`| `mailbox@host`
|`freeform`| `An arbitrary string of text`
|`geopoint`| `52.5246, 13.4033` (latitude, longitude) 
|`ip`| `1.2.3.4`, `1234:5678:90ab:cdef:1234:5678:90ab:cdef`
|`ipv4`| `1.2.3.4`
|`ipv6`| `1234:5678:90ab:cdef:1234:5678:90ab:cdef`
|`number`| `12345`
|`record_type`| `task`, `ticket`, `worker`
|`timestamp`| `1606955026`
|`uri`| `some-unique-identifier` (letters, numbers, dots, dashes)
|`url`| `https://example.com/`

### placeholder:

An optional tooltip displayed in the text box when there is no input.

### default:

An optional default value.

### max_length:

An optional maximum length for the text input.

|Type|Default Max Length
|-|-
|`freeform`| 1,024
|`url`| 2,048
| (everything else) | 255

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

<pre>
<code class="language-cerb">
{% raw %}
text/prompt_name:
  label: Name:
  required@bool: yes
  type: freeform
  validation@raw:
    {% if prompt_name is empty %}
    A name is required.
    {% elseif prompt_name|length < 8 %}
    A name must be 8 or more characters. 
    {% elseif prompt_name|length > 32 %}
    A name must be less than 32 characters. 
    {% endif %}{% endraw %}
</code>
</pre>