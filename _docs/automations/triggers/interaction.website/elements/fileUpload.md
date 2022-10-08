---
title: "File Upload - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/elements/fileUpload/
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
    label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **fileUpload** element allows a user to upload one or more files as [automation resource](/docs/records/types/automation_resource/) records.

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/file-upload.png" class="screenshot">
</div>

# Examples

## Upload a single file

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/form:
    form:
      title: Form Title
      elements:
        fileUpload/prompt_file:
          label: Upload a file:
          required@bool: yes
          validation@raw:
            {% if prompt_file_mime_type != 'image/png' %}
            The file must be a PNG image ({{prompt_file_mime_type}})
            {% elseif prompt_file_size > 1024000 %}
            The file ({{prompt_file_size|bytes_pretty}}) must be smaller than 1MB.
            {% endif %}
{% endraw %}
</code>
</pre>

The output placeholder is set to the new automation resource token.

The placeholder is also key expandable. In the above example, `prompt_file` could be expanded with `prompt_file_name` or `prompt_file_size`.

## Upload multiple files

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/form:
    form:
      title: Form Title
      elements:
        fileUpload/prompt_files:
          label: Upload files:
          required@bool: yes
          multiple@bool: yes
          accept: .png,image/png,.jpg,image/jpeg

  await/results:
    form:
      title: Results
      elements:
        say:
          content@text:
            You uploaded:
            {% for prompt_file in prompt_files__records %}
            * {{prompt_file.name}} ({{prompt_file.size|bytes_pretty}})
            {% endfor %}
{% endraw %}
</code>
</pre>

The output placeholder is set to a list of automation resource tokens.

Another output placeholder is set with a `__records` suffix. This includes the full dictionaries for the resource token. In the above example, the key would be `prompt_files__records`.

## Upload multiple files and convert to attachments

<pre>
<code class="language-cerb">
{% raw %}
start:
  await/form:
    form:
      title: Form Title
      elements:
        fileUpload/prompt_files:
          label: Upload files:
          required@bool: yes
          multiple@bool: yes
          accept: .png,image/png,.jpg,image/jpeg

  repeat:
    each@key: prompt_files__records
    as: prompt_file
    do:
      record.create:
        inputs:
          record_type: attachment
          fields:
            name: {{prompt_file.name}}
            mime_type: application/vnd.cerb.uri
            content: cerb:automation_resource:{{prompt_file.token}}
        output: new_file
{% endraw %}
</code>
</pre>

# Syntax

### label:

The optional label to display above the form element.

### accept:

An optional comma-delimited list of file extensions or MIME types to accept in the browser file chooser. If omitted, all files are available for selection.

### multiple@bool:

If `yes`, multiple files may be uploaded at once. The result is an array of [automation resource](/docs/records/types/automation_resource/) dictionaries.

If omitted or `no`, a single file may be uploaded. The result is a single automation resource dictionary.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

<pre>
<code class="language-cerb">
{% raw %}
fileUpload/prompt_file:
  label: Upload a file:
  required@bool: yes
  validation@raw:
    {% if prompt_file_mime_type != 'image/png' %}
    The file must be a PNG image ({{prompt_file_mime_type}})
    {% elseif prompt_file_size > 1024000 %}
    The file ({{prompt_file_size|bytes_pretty}}) must be smaller than 1MB.
    {% endif %}
{% endraw %}
</code>
</pre>