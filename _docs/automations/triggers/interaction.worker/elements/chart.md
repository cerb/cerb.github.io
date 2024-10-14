---
title: "Chart - Interaction Form Element"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/elements/chart/
toc:
  title: Chart
  expand: Automations
jumbotron:
  title: Chart
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

In [interaction](/docs/automations/triggers/interaction.worker/) web forms, a **chart** element renders an interactive data visualization.

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Chart
      elements:
        chart/prompt_chart:
          label: Tickets by group (past 1 year):
          datasets:
            dataQuery/tickets:
              query@text:
                type:worklist.subtotals
                of:ticket
                by:[created@month,group~20]
                query:(created:"-1 year to now")
                format:timeseries
          schema:
            data:
              type: bar
              series:
                tickets:
                  x_key: ts
              stacks:
                0@csv: tickets
            axis:
              x:
                type: timeseries
                tick:
                  format:
                    date:
                      pattern: %b %Y
                  fit@bool: no
                  multiline@bool: no
                  rotate: -90
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/automations/triggers/interaction.worker/elements/chart.png" class="screenshot">
</div>

# Syntax

### label:

The optional label to display above the form element.

### datasets:

The [datasets](/docs/dashboards/widgets/chart-kata/#datasets) to load and pass to the visualization.

| Type | 
|-|-
| `automation:` |
| `dataQuery:` |
| `manual:` | 

### schema:

The [schema](/docs/dashboards/widgets/chart-kata/#chart) to render.