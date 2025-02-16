---
title: Textarea - Interaction Form Element
excerpt: This page provides detailed information on the use of the **textarea** element
  in interaction web forms within Cerb.
summary: This page provides detailed information on the use of the **textarea** element
  in interaction web forms within Cerb. It explains the syntax and various optional
  attributes that can be configured for a textarea, such as `label`, `required`, `placeholder`,
  `default`, `max_length`, `min_length`, `truncate`, and `validation`. The page includes
  examples of how to set these attributes, including a custom validation script to
  ensure user input meets specific criteria. The textarea element is designed for
  multi-line text input without additional editor functionalities, and the page guides
  users on how to implement and customize it effectively in their forms.
permalink: /docs/automations/triggers/interaction.worker/elements/textarea/
toc:
  title: Textarea
  expand: Automations
jumbotron:
  title: Textarea
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **textarea** element displays a multi-line text input without the extra functionality of an [editor](/docs/automations/triggers/interaction.worker/elements/editor/).

{% highlight cerb %}
{% raw %}
start:
  await:
    form:
      elements:
        textarea/prompt_comment:
          label: Please share your experience:
{% endraw %}
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/textarea.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### hidden:

This form element can be conditionally hidden.

{% highlight cerb %}
{% raw %}
hidden@bool: {{not worker_is_superuser}}
{% endraw %}
{% endhighlight %}

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.

### placeholder:

An optional tooltip displayed in the text box when there is no input.

### default:

An optional default value.

### max_length:

An optional maximum length for the text input (default `1024`). This displays a character count when set.

### min_length:

An optional minimum length for the text input.

### truncate:

If input longer than `max_length:` is truncated (default `yes`) or unmodified.

### validation:

An optional custom validation script. Any output is considered to be an error.

You can use `if...elseif` to check multiple conditions.

{% highlight cerb %}
{% raw %}
textarea/prompt_comment:
  label: Comment:
  validation@raw:
    {% if prompt_comment is empty %}
    A comment is required.
    {% elseif prompt_comment|length < 100 %}
    A comment must be at least 100 characters. 
    {% endif %}
{% endraw %}
{% endhighlight %}