---
title: "Search Query - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/query/
toc:
  title: Search Query
  expand: Automations
jumbotron:
  title: Search Query
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **query** element displays a search query prompt with filter autocompletion.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Search Tickets
      elements:
        query/prompt_query:
          label: Query:
          record_type: ticket
          default@text:
            status:o
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/query.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### record_type:

The [record type](/docs/records/types/) to use for query autocompletion. For instance, `ticket` or `worker`.

### required@bool:

If user input is required on this element use a value of `yes`. Otherwise, omit.
