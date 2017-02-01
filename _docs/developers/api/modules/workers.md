---
title: Workers
permalink: /docs/api/modules/workers/
jumbotron:
  title: Workers
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Current Worker

**GET /workers/me.json**

Retrieve the object for the current worker based on the given API credentials.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workers/me.json');
</code>
</pre>

# Create

**POST /workers/create.json**

Create a worker object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `email` | string | **required**
| `first_name` | string 
| `is_disabled` | bit | `0`=active, `1`=disabled
| `is_superuser` | bit | `0`=worker, `1`=superuser
| `last_name` | string 
| `password` | string 
| `title` | string 
| `updated` | timestamp 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('email','tony.stark@example.com'),
    array('first_name','Tony'),
    array('last_name','Stark'),
    array('password','test'),
);
$out = $cerb->post($base_url . 'workers/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /workers/`<id>`.json**

Retrieve a worker object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workers/1.json');
</code>
</pre>

# Update

**PUT /workers/`<id>`.json**

Update a worker object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `email` | string 
| `first_name` | string 
| `is_disabled` | bit | `0`=active, `1`=disabled
| `is_superuser` | bit | `0`=worker, `1`=superuser
| `last_name` | string 
| `password` | string 
| `title` | string 
| `updated` | timestamp 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('title','Superhero'),
    array('password','new'),
);
$out = $cerb->put($base_url . 'workers/1.json', $postfields);
</code>
</pre>

# Search

**POST /workers/search.json**

Perform a search for worker objects.

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
| `email` | string
| `first_name` | string
| `id` | integer
| `is_disabled` | bit | `0`=active, `1`=disabled
| `is_superuser` | bit | `0`=worker, `1`=superuser
| `last_name` | string
| `title` | string
| `updated` | timestamp
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `fieldsets` | Custom fieldsets on workers
| `first_name` | Workers by first name
| `is_disabled` | Workers by active/disabled
| `is_superuser` | Workers by superuser/worker
| `last_name` | Workers by last name
| `links` | Objects linked to workers
| `title` | Workers by title

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
     array('q','Developer'),
     array('sortBy','first_name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'workers/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
     array('criteria[]','is_superuser'),
     array('oper[]','='),
     array('value[]','0'),
     array('criteria[]','first_name'),
     array('oper[]','like'),
     array('value[]','*'),
     array('sortBy','first_name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'workers/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}