---
title: "File Upload - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/elements/fileUpload/
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
    label: ui.interaction &raquo;
    url: /docs/automations/triggers/ui.interaction/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/ui.interaction/#elements
---

{% include docs/note_preview.html %}

In [interaction](/docs/automations/triggers/ui.interaction/) web forms, a **fileUpload** element displays a file upload prompt. This creates an [attachment](/docs/records/types/attachment/) record and returns its record ID.

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
<img src="/assets/images/docs/automations/triggers/ui.interaction/elements/fileUpload.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.