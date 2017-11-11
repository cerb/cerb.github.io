---
title: Notifications
permalink: /docs/api/deprecated/notifications/
jumbotron:
  title: Notifications
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

# Create

**POST /notifications/create.json**

Create a notification object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `context` | string
| `context_id` | integer
| `created` | timestamp
| `is_read` | bit
| `message` | string
| `worker_id` | integer

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('context','cerberusweb.contexts.ticket'),
    array('context_id',123),
    array('message','This is a new notification!'),
    array('worker_id', 1),
);
$out = $cerb->post($base_url . 'notifications/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /notifications/`<id>`.json**

Retrieve a notification object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'notifications/1.json');
</code>
</pre>

# Update

**PUT /notifications/`<id>`.json**

Update a notification object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `context` | string
| `context_id` | integer
| `created` | timestamp
| `is_read` | bit
| `message` | string
| `worker_id` | integer

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('worker_id','1'),
    array('title','You have a *new* notification!'),
);
$out = $cerb->put($base_url . 'notifications/1.json', $postfields);
</code>
</pre>

# List

**GET /notifications/list.json**

Lists the notification objects for the authenticated worker.

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'notifications/list.json');
</code>
</pre>

You can also list only unread notifications:

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'notifications/list.json?unread=1');
</code>
</pre>

# Search

**POST /notifications/search.json**

Perform a search for notification records.

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
| `context` | string
| `context_id` | integer
| `created` | timestamp
| `is_read` | bit
| `message` | string
| `worker_id` | integer

**subtotals[]**

|---
| Field | Description
|-|-
| `activity_point` | Notifications by activity type
| `is_read` | Notifications by read status

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','isRead:n'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'notifications/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','is_read'),
    array('oper[]','='),
    array('value[]','0'),
    array('criteria[]','worker_id'),
    array('oper[]','='),
    array('value[]','1'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'notifications/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}