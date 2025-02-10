---
title: 'Data Queries: Calendar Availability'
excerpt: This page provides information on the `calendar.availability` data queries
  in Cerb, which are used to aggregate and display calendar availability over a specified
  date range by hour or day.
summary: This page provides information on the `calendar.availability` data queries
  in Cerb, which are used to aggregate and display calendar availability over a specified
  date range by hour or day. It is particularly useful for visualizing group availability
  for tasks such as shift planning. The page details the necessary inputs for the
  query, including the calendars to be included and the date range for availability.
  It also describes the response formats available, which include a default dictionary
  format suitable for spreadsheets and APIs, and a timeblocks format ideal for visualizations.
  An example query is provided to illustrate how to use the `calendar.availability`
  feature to check the availability of a support group over the current month.
permalink: /docs/data-queries/calendar/availability/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Calendar Availability
jumbotron:
  title: Calendar Availability
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Data Queries &raquo;
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

{% highlight cerb %}
{% raw %}
type:calendar.availability
range:"this month"
calendars:(
  workerAvailability:(group:(name:"Support"))
)
format:timeblocks
{% endraw %}
{% endhighlight %}

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-response_times.png" class="screenshot">
</div>
{% endcomment %}
