---
title: "Textarea - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.web.worker/elements/textarea/
toc:
  title: Textarea
  expand: Automations
jumbotron:
  title: Textarea
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.web.worker &raquo;
    url: /docs/automations/triggers/interaction.web.worker/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.web.worker/#elements
---

{% include docs/note_preview.html %}

In [interaction](/docs/automations/triggers/interaction.web.worker/) web forms, a **textarea** element displays a multi-line text input without the extra functionality of an [editor](/docs/automations/triggers/interaction.web.worker/elements/editor/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      elements:
        textarea/prompt_comment:
          label: Please share your experience:
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.web.worker/elements/textarea.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### placeholder:

An optional tooltip displayed in the text box when there is no input.

### default:

An optional default value.

### max_length:

An optional maximum length for the text input.