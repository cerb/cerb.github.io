---
title: "Data Queries: Snippet Usage"
excerpt: 
permalink: /docs/data-queries/usage/snippets/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Snippet Usage
jumbotron:
  title: Snippet Usage
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# usage.snippets
{: .no_toc}

`usage.snippets` data queries return historical usage data for snippets (e.g. uses by worker over time).

* TOC
{:toc}

# Inputs

(none)

# Response Formats

* **table** (default) returns tabular data (columns and rows) suitable for the "Chart: Table" visualization widget.

* **timeseries** returns series-based data suitable for the "Chart: Time Series" visualization widget (the x-axis values are timestamps).

# Examples

<pre>
<code class="language-text">
{% raw %}
type:usage.snippets
format:timeseries
{% endraw %}
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-snippet-usage.png" class="screenshot">
</div>
