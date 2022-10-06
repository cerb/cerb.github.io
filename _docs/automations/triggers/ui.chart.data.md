---
title: "ui.chart.data"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.chart.data/
toc:
  title: ui.chart.data
  expand: Automations
jumbotron:
  title: ui.chart.data
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**ui.chart.data** [automations](/docs/automations/) are used as a dataset by [Chart KATA](/docs/dashboards/widgets/chart-kata/) widgets.

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `widget_*` | record | The [card](/docs/records/types/card_widget/), [profile](/docs/records/types/profile_widget/), or [workspace](/docs/records/types/workspace_widget/) widget record (supports key expansion)
| `worker_*` | record | The active [worker](/docs/records/types/worker/) record. Supports key expansion.

# Outputs

## return:

| Key | Type | Notes
|-|-|-
| `data` | dictionary | The chart data as an array of series with the same length

<pre>
<code class="language-cerb">
{% raw %}
return:
  data:
    ts@csv: 2023-10, 2023-11, 2023-12
    series0@csv: 104, 77, 84 
    series1@csv: 218, 335, 183
{% endraw %}
</code>
</pre>