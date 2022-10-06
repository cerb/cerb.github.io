---
title: "File Download - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/fileDownload/
toc:
  title: File Download
  expand: Automations
jumbotron:
  title: File Download
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **fileDownload** element displays a form button that downloads an attachment or automation resource file when clicked.

This is particularly useful for interactions that generate large or binary output, like a dynamic image, a CSV/JSON export, or a ZIP archive.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Interaction Download
      elements:
        fileDownload/prompt_file:
          label: Download:
          uri: cerb:automation_resource:3b1f58c2-1234-11ed-b9e9-01791ccb5549
          filename: example.zip
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/file-download.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### filename:

The filename to show on the download button.

### uri:

A URI for an [attachment](/docs/records/types/attachment/) or [automation resource](/docs/records/types/automation_resource/) to download.