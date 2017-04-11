---
title: Activity Log
permalink: /docs/api/modules/activity-log/
jumbotron:
  title: Activity Log
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

# Search

**POST /activity_log/search.json**

Perform a search for activity log records.

### Parameters
{: .no_toc}

|--
| Name | Description | Type
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
| Field | Type
|-|-
| `created` | timestamp
| `id` | integer

**expand**

|---
| Key | Description
|-|-
| `actor_` | The actor (worker, bot, contact) who performed the activity
| `target_` | The record being acted on

**subtotals[]**
		
|---
| Key | Description
|-|-
| `activity` | The activity performed (e.g. commented, replied)
| `actor` | The actor (worker, bot, contact) who performed the activity
| `target` | The record being acted on

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','actor.worker:(id:1) activity:"worker.logged_in" created:"-1 month"'),
    array('expand','actor_'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'activity_log/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('q','actor.bot:(sla) target:[ticket,task]'),
    array('expand','actor_,target_'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'activity_log/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}
