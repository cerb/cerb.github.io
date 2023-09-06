---
title: "File Upload - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/fileUpload/
toc:
  title: File Upload
  expand: Automations
jumbotron:
  title: File Upload
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **fileUpload** element displays a file upload prompt. This creates an [attachment](/docs/records/types/attachment/) or [automation resource](/docs/records/types/automation_resource/) record and returns its ID or token.

The element name (e.g. `fileUpload/photo` in the example below) is used to set a placeholder.

If uploading an attachment and the name ends with `_id`, then a corresponding `__context` key will be added with the same prefix. Otherwise, keys for `_id` and `__context` will be added with the element name as the prefix. This allows key expansion of the file's fields (e.g. `name`, `size`) directly on the placeholder, as well as from within a `validation@raw:` script.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        fileUpload/photo:
          label: Upload a photo:
          as: automation_resource
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/fileUpload.png" class="screenshot">
</div>

# Syntax

### as:

The record type to create with the uploaded file.

|---
|Record|
|-|-|
| `attachment` | (default) A long-term file [attachment](/docs/records/types/attachment/). This returns a record dictionary.
| `automation_resource` | A temporary [automation resource](/docs/records/types/automation_resource/). This returns the resource token.

### label:

The optional label to display above the form element.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        fileUpload/prompt_image:
          label: File
          required@bool: yes
          as: attachment
          validation@raw:
            {% if prompt_image__context is empty or prompt_image_id is empty %}
            The file must be a valid image.
            {% elseif prompt_image_mime_type is not prefixed ('image/') %}
            The file must be an image ({{prompt_image_mime_type}}).
            {% elseif prompt_image_size > 50000 %}
            The image must be smaller than 50KB ({{prompt_image_size|bytes_pretty}}).
            {% endif %}{% endraw %}
</code>
</pre>