---
title: Search Query - Interaction Form Element
excerpt: This page provides information on the "query" element used in interaction
  web forms within Cerb.
summary: This page provides information on the "query" element used in interaction
  web forms within Cerb. It explains how this element displays a search query prompt
  with filter autocompletion, specifically for searching records like tickets or workers.
  The page details the syntax for configuring the query element, including optional
  parameters such as the label to display above the form element, the record type
  for autocompletion, and whether user input is required.
permalink: /docs/automations/triggers/interaction.worker/elements/query/
toc:
  title: Search Query
  expand: Automations
jumbotron:
  title: Search Query
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **query** element displays a search query prompt with filter autocompletion.

{% highlight cerb %}
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
{% endhighlight %}

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
