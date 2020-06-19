---
title: "Data Queries: Calendar Events"
excerpt: 
permalink: /docs/data-queries/calendar/events/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Calendar Events
jumbotron:
  title: Calendar Events
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# calendar.events
{: .no_toc}

`calendar.events` queries return events and synthesized recurring events for the given calendars grouped into days.

* TOC
{:toc}

# Inputs

* `calendar:`  (a [search query](/docs/search/) of [calendar](/docs/records/types/calendar/#search-query-fields) records to include)
* `from:` (return events from this starting datetime)
* `to:` (return events until this ending datetime)
* `expand:` (the keys to expand on the returned event dictionaries)

# Response Formats

The results can be returned in these formats:

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

# Examples

<pre>
<code class="language-cerb">
{% raw %}
type:calendar.events
calendar:(name:["U.S. Holidays","Office Hours"])
from:"this week Monday 00:00:00"
to:"this week Sunday 23:59:59"
expand:[calendar_owner_]
format:dictionaries
{% endraw %}
</code>
</pre>

{% comment %}
<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-metric-response_times.png" class="screenshot">
</div>
{% endcomment %}
