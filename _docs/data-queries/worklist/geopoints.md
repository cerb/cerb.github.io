---
title: 'Data Queries: Geo Points'
excerpt: This page provides detailed information on using the `worklist.geo.points`
  data queries in Cerb to retrieve and plot geolocation data from worklist records.
summary: This page provides detailed information on using the `worklist.geo.points`
  data queries in Cerb to retrieve and plot geolocation data from worklist records.
  It explains the structure and components of the query, including the `series.*`
  parameters such as `of`, `point`, `fields`, `query`, and `query.required`, which
  define the type of records, the field containing geolocation data, additional fields
  to include, and filtering criteria. The page also describes the output formats available,
  such as `geopoints` and `table`, and provides examples, like plotting organizations
  based on geolocation custom fields, to illustrate practical applications of these
  queries.
permalink: /docs/data-queries/worklist/geopoints/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Geo Points
jumbotron:
  title: Worklist Geo Points
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.geo.points
{: .no_toc}

`worklist.geo.points` [data queries](/docs/data-queries/) returns geolocation data from worklist records.

{% highlight cerb %}
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
{% endhighlight %}

* TOC
{:toc}

# series.*

Each `series.*` should provide:

## of:

The `of:` key specifies the type of [records](/docs/records/) to search.

{% highlight cerb %}
{% raw %}
of:tickets
{% endraw %}
{% endhighlight %}

## point:

The `point:` key specifies the record [field](/docs/records/fields/) containing latitude/longitude data.

{% highlight cerb %}
{% raw %}
point:coordinates
{% endraw %}
{% endhighlight %}

## fields:

The `fields:` key specifies the record [fields](/docs/records/fields/) to include with each plotted point.

{% highlight cerb %}
{% raw %}
point:coordinates
{% endraw %}
{% endhighlight %}

## query:

The `query:` key specifies a [search query](/docs/search/) for filtering records.

{% highlight cerb %}
{% raw %}
query:(region:Europe)
{% endraw %}
{% endhighlight %}

## query.required:

The `query.required:` key specifies a mandatory [search query](/docs/search/) for filtering records. This should be protected from user-entered filters.

{% highlight cerb %}
{% raw %}
query.required:(ids:[1,2,3])
{% endraw %}
{% endhighlight %}

# format:

The results can be returned in various formats:

* **geopoints** (default) returns a list of latitude/longitude points.

* **table** returns tabular output, suitable for display with the 'Chart: Table' visualization widget.

# Examples

## Plot organizations based on a geolocation custom field.

{% highlight cerb %}
type:worklist.geo.points
series.points:(
  of:org
  point:coordinates
  fields:[name,coordinates]
  query:(coordinates:!null)
)
format:geojson
{% endhighlight %}

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-geopoints-world.png" class="screenshot">
</div>
