---
title: "Data Queries: Calendar Availability"
excerpt: 
permalink: /docs/data-queries/calendar/availability/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Calendar Availability
jumbotron:
  title: Calendar Availability
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# calendar.availability
{: .no_toc}

`calendar.avalability` queries aggregate any number of matching calenders to display availability over a date range by hour or day.

For instance, this can be used to visualize when a group is most or least available for shift planning.

* TOC
{:toc}

# Inputs

* `calendars:`  (a [search query](/docs/search/) of [calendar](/docs/records/types/calendar/#search-query-fields) records to include)
* `range:` (return availability within these dates)

# Response Formats

The results can be returned in these formats:

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

* **timeblocks** returns a blocks-based format suitable for visualizations.

# Examples

<pre>
<code class="language-cerb">
{% raw %}
type:calendar.availability
range:"this month"
calendars:(
  workerAvailability:(group:(name:"Support"))
)
format:timeblocks
{% endraw %}
</code>
</pre>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-response_times.png" class="screenshot">
</div>
{% endcomment %}
