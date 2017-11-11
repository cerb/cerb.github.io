---
title: Calendars
permalink: /docs/api/deprecated/calendars/
jumbotron:
  title: Calendars
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/modules/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# List

**GET /calendars/list.json**

Retrieve the calendars accessible by the current worker.  This includes calendars owned by the worker, their groups, or roles.

**Parameters:**

|---
| Field | Description
|-|-
| `expand` | The keys to expand for each object as a comma-separated string.
| `month` | The calendar month to display.  This defaults to the current month.
| `year` | The calendar year to display.  This defaults to the current year.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'calendars/list.json?expand=owner');
</code>
</pre>

Retrieve
========
**GET /calendars/`<id>`.json**

Retrieve a calendar record.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string
| `month` | The calendar month to display | integer
| `year` | The calendar year to display | integer


**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'calendar/1.json?month=12&year=2013&expand=weeks_events');
</code>
</pre>
	
Search
======
**POST /calendars/search.json**

Perform a search for calendar objects.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string
| `limit` | The number of results to display per page | integer
| `page` | The page of results to display given limit | integer
| `q` | Filters to add using quick search syntax | string
| `sortAsc` | `0` _(descending)_ or `1` _(ascending)_ | bit
| `sortBy` | The field to sort results by | string
| `subtotals[]` | Multiple subtotal sets can be returned | string 

**expand**

|---
| Field | Description
|-|-
| `events_occluded` | Retrieve event information for this calendar.  Unlike `weeks_events`, this just returns a flat list of events sorted by their start date in ascending order.  Any available events that are completely occluded by busy events (e.g. all-day holidays) will be filtered out automatically.
| `events` | Retrieve event information for this calendar.  Unlike `weeks_events`, this just returns a flat list of events sorted by their start date in ascending order.
| `owner` | Retrieve detailed information about this calendar's owner.
| `scope` | Retrieve full calendar information with enough information to render the calendar.  This is automatically included when any of the `events` or `weeks` keys are expanded.
| `weeks_events_occluded` | Retrieves event information for each day on this calendar.  This automatically includes `weeks` and adds an `events_occluded` list to each day.  Any available events that are completely occluded by busy events (e.g. all-day holidays) will be filtered out automatically.
| `weeks_events` | Retrieves event information for each day on this calendar.  This automatically includes `weeks` and adds an `events` list to each day.
| `weeks` | Retrieve a padded list of weeks and days to easily render this calendar.

**sortBy**

|---
| Field | Type |
|-|-|-
| `id` | integer | 
| `name` | string |
| `owner_context` | string | 
| `owner_context_id` | integer |
| `updated` | timestamp | 
| `custom_*` | mixed | 

**subtotals[]**

|---
| Key | Description
|-|-
| `fieldsets` | Custom fieldsets on the calendars
| `owner` | Calendar owners
| `links` | Records linked to calendars
| `watchers` | Watchers on calendars

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('expand','owner,weeks_events'),
    array('q','SLA'),
    array('sortBy','name'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'calendars/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('expand','owner,weeks_events'),
    array('criteria[]','name'),
    array('oper[]','='),
    array('value[]','SLA'),
    array('sortBy','name'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'calendars/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}