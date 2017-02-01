---
title: Time Tracking
permalink: /docs/api/modules/timetracking/
jumbotron:
  title: Time Tracking
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# List Activities

**GET /timetracking/activities.json**

Retrieve a list of activity IDs and names.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'timetracking/activities.json');
</code>
</pre>

# Create

**POST /timetracking/create.json**

Create a time tracking object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `activity_id` | integer
| `created` | timestamp
| `is_closed` | integer
| `mins` | integer
| `worker_id` | integer | [worker](/docs/api/workers/)
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('activity_id','0'),
    array('mins','65'),
    array('worker_id','1'),
);
$out = $cerb->post($base_url . 'timetracking/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /timetracking/`<id>`.json**

Retrieve a time tracking object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'timetracking/1.json');
</code>
</pre>

# Update

**PUT /timetracking/`<id>`.json**

Update a time tracking object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `activity_id` | integer
| `created` | timestamp
| `is_closed` | integer
| `mins` | integer
| `worker_id` | integer | [worker](/docs/api/workers/)
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('activity_id','1'),
    array('is_closed','1'),
);
$out = $cerb->put($base_url . 'timetracking/123.json', $postfields);
</code>
</pre>

# Search

**POST /timetracking/search.json**

Perform a search for time tracking objects.

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

**sortBy**

|---
| Field | Type | 
|-|-|-
| `activity_id` | integer
| `created` | timestamp
| `id` | integer
| `is_closed` | integer
| `mins` | integer
| `worker_id` | integer | [worker](/docs/api/workers/)
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `activity` | Time tracking by activity
| `fieldsets` | Custom fieldsets on time tracking
| `is_closed` | Time tracking by open/closed
| `links` | Objects linked to time tracking
| `watchers` | Watchers on time tracking
| `worker_id` | Time tracking by worker

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q[]','isClosed:n'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'timetracking/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','org_id'),
    array('oper[]','='),
    array('value[]','1'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'timetracking/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}