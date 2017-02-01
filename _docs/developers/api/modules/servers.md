---
title: Servers
permalink: /docs/api/modules/servers/
jumbotron:
  title: Servers
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Create

**POST /servers/create.json**

Create a new server object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `name` | string | **required**
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('name','server.example.com'),
);
$out = $cerb->post($base_url . 'servers/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /servers/`<id>`.json**

Retrieve a server object.

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'servers/1.json');
</code>
</pre>

# Update

**PUT /servers/`<id>`.json**

Update a server object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `name` | string | 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('name', 'server.example.com'),
);
$out = $cerb->put($base_url . 'servers/1.json', $postfields);
</code>
</pre>
	
# Search

**POST /servers/search.json**

Perform a search for server objects.

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
| `id` | integer | 
| `name` | string | 
| `custom_*` | mixed | 

**subtotals[]**

|---
| Key | Description | 
|-|-|-
| `fieldsets` | Custom fieldsets on servers
| `links` | Objects linked to servers
| `watchers` | Watchers on servers

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
     array('q','name:R*'),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'servers/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
     array('criteria[]','name'),
     array('oper[]','like'),
     array('value[]','*'),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'servers/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}