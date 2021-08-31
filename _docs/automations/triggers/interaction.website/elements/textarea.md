---
title: "Textarea - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.website/elements/textarea/
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
    label: interaction.website &raquo;
    url: /docs/automations/triggers/interaction.website/
  -
    label: Elements &raquo;
    url: /docs/automations/triggers/interaction.website/#elements
---

In [website interactions](/docs/automations/triggers/interaction.website/) forms, a **textarea** element displays a multi-line text input without the extra functionality of an [editor](/docs/automations/triggers/interaction.website/elements/editor/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Example
      elements:
        textarea/prompt_comment:
          label: Please share your experience:
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.website/elements/textarea.png" class="screenshot">
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

An optional maximum length for the text input (default `1024`).

### min_length:

An optional minimum length for the text input.

### truncate:

If input longer than `max_length:` is truncated (default `yes`) or unmodified.

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

<pre>
<code class="language-cerb">
{% raw %}
textarea/prompt_comment:
  label: Comment:
  validation@raw:
    {% if prompt_comment is empty %}
    A comment is required.
    {% elseif prompt_comment|length < 100 %}
    A comment must be at least 100 characters. 
    {% endif %}{% endraw %}
</code>
</pre>