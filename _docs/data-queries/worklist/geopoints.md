---
title: "Data Queries: Geo Points"
excerpt: 
permalink: /docs/data-queries/worklist/geopoints/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Geo Points
jumbotron:
  title: Worklist Geo Points
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.geo.points
{: .no_toc}

`worklist.geo.points` [data queries](/docs/data-queries/) returns geolocation data from worklist records.

<pre>
<code class="language-text">
{% raw %}
type:worklist.geo.points
series.points:(
  of:org
  point:coordinates
  fields:[name,coordinates]
  query:(coordinates:!null)
)
format:geojson
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# series.*

Each `series.*` should provide:

## of:

The `of:` key specifies the type of [records](/docs/records/) to search.

<pre>
<code class="language-text">
{% raw %}
of:tickets
{% endraw %}
</code>
</pre>

## point:

The `point:` key specifies the record [field](/docs/records/fields/) containing latitude/longitude data.

<pre>
<code class="language-text">
{% raw %}
point:coordinates
{% endraw %}
</code>
</pre>

## fields:

The `fields:` key specifies the record [fields](/docs/records/fields/) to include with each plotted point.

<pre>
<code class="language-text">
{% raw %}
point:coordinates
{% endraw %}
</code>
</pre>

## query:

The `query:` key specifies a [search query](/docs/search/) for filtering records.

<pre>
<code class="language-text">
{% raw %}
query:(region:Europe)
{% endraw %}
</code>
</pre>

# format:

The results can be returned in various formats:

* **geopoints** (default) returns a list of latitude/longitude points.

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget.

# Examples

## Plot organizations based on a geolocation custom field.

<pre>
<code class="language-text">
type:worklist.geo.points
series.points:(
  of:org
  point:coordinates
  fields:[name,coordinates]
  query:(coordinates:!null)
)
format:geojson
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-geopoints-world.png" class="screenshot">
</div>
