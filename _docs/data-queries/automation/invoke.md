---
title: "Data Queries: Automation Invoke"
excerpt: 
permalink: /docs/data-queries/automation/invoke/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Automation Invoke
jumbotron:
  title: Automation Invoke
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# automation.invoke
{: .no_toc}

`automation.invoke` queries run a [data.query](/docs/automations/triggers/data.query/) to return custom results. This can be used to integrate with third-party data sources (e.g. APIs).

# Inputs

|---
|Key|Description
|-|-
|`name:`| The automation name to invoke. Must be of type `data.query`.
|`inputs:`| The inputs to send to the automation.

# Response Formats

The supported result formats are determined by each automation.

# Examples

<pre>
<code class="language-cerb">
{% raw %}
type:automation.invoke
name:example.fetchApiData
inputs:(
  dateRange:"this year"
)
format:dictionaries
{% endraw %}
</code>
</pre>