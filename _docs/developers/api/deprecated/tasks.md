---
title: Tasks
permalink: /docs/api/deprecated/tasks/
jumbotron:
  title: Tasks
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

**POST /tasks/create.json**

Create a task object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `completed` | timestamp
| `due` | timestamp
| `reopen_at` | timestamp
| `status_id` | integer | `0`=open, `1`=closed, `2`=waiting
| `title` | string | **required**
| `updated` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('title','Finish documentation'),
);
$out = $cerb->post($base_url . 'tasks/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /tasks/`<id>`.json**

Retrieve a task object.

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'tasks/1.json');
</code>
</pre>

# Update

**PUT /tasks/`<id>`.json**

Update a task object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `completed` | timestamp
| `due` | timestamp
| `reopen_at` | timestamp
| `status_id` | integer | `0`=open, `1`=closed, `2`=waiting
| `title` | string
| `updated` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('title','Complete documentation'),
    array('assignee_id', '1'),
);
$out = $cerb->put($base_url . 'tasks/1.json', $postfields);
</code>
</pre>
	
# Search

**POST /tasks/search.json**

Perform a search for task objects.

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
| `completed` | timestamp
| `due` | timestamp
| `id` | integer
| `status_id` | integer
| `title` | string
| `updated` | timestamp
| `watchers` | integer[]
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description | 
|-|-|-
| `fieldsets` | Custom fieldsets on the addresses
| `status_id` | Tasks by status
| `links` | Objects linked to addresses
| `watchers` | Watchers on addresses

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','due:today'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'tasks/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','title'),
    array('oper[]','like'),
    array('value[]','t*'),
    array('criteria[]','watchers'),
    array('oper[]','in'),
    array('value[]','[1,2,3]'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'tasks/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}