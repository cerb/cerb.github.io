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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **fileUpload** element displays a file upload prompt. This creates an [attachment](/docs/records/types/attachment/) record and returns its record ID.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        fileUpload:
          label: Upload a photo:
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/fileUpload.png" class="screenshot">
</div>

# Syntax

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