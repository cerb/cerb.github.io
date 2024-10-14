---
title: "Chooser - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/chooser/
toc:
  title: Chooser
  expand: Automations
jumbotron:
  title: Chooser
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

(Added in [11.0](/releases/11.0/))

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **chooser** element displays a search popup for selecting [records](/docs/records/).

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Chooser
      elements:
        chooser/prompt_chooser:
          label: Choose records:
          record_type: worker
          query@text: isDisabled:n
          multiple@bool: yes
          required@bool: yes
  await/response:
    form:
      elements:
        say:
          content@text:
            You selected record IDs: {{prompt_chooser|join(', ')}}
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/chooser.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### record_type:

The [record type](/docs/records/types/) to choose from.

### query:

The optional [search query](/docs/search/) for filtering the search worklist.

### multiple:

If `yes` then multiple records may be selected at once. The default is `no` for single selection.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.