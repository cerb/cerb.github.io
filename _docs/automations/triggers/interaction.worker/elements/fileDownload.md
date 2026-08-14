---
title: File Download - Interaction Form Element
excerpt: This page provides detailed information on the **fileDownload** element used
  in interaction web forms within Cerb.
summary: This page provides detailed information on the **fileDownload** element used
  in interaction web forms within Cerb. It explains how this element can be utilized
  to create a form button that facilitates the downloading of attachments or automation
  resource files, which is particularly beneficial for interactions that produce large
  or binary outputs such as dynamic images, CSV/JSON exports, or ZIP archives. The
  page includes syntax details for implementing the fileDownload element, covering
  parameters like `data`, `label`, `filename`, and `uri`, which define the content
  to download, the label displayed, the filename on the download button, and the URI
  for the resource, respectively.
permalink: /docs/automations/triggers/interaction.worker/elements/fileDownload/
toc:
  title: File Download
  expand: Automations
jumbotron:
  title: File Download
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  - label: Elements &raquo;
    url: /docs/automations/triggers/interaction.worker/#elements
---

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **fileDownload** element displays a form button that downloads an attachment or automation resource file when clicked.

This is particularly useful for interactions that generate large or binary output, like a dynamic image, a CSV/JSON export, or a ZIP archive.

{% highlight cerb %}
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
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/file-download.png" class="screenshot">
</div>

# Syntax

### data:

The raw content to download. Alternative to `uri:`.

### label:

The optional label to display above the form element.

### filename:

The filename to show on the download button.

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{not worker_is_superuser}}
{% endraw %}
{% endhighlight %}

### uri:

A URI for an [attachment](/docs/records/types/attachment/), [automation resource](/docs/records/types/automation_resource/), or [resource](/docs/records/types/resource/) to download. Alternative to `data:`.