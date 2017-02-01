---
title: Groups
permalink: /docs/api/modules/groups/
jumbotron:
  title: Groups
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Retrieve

**GET /groups/`<id>`.json**

Retrieve a group object.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
|---
| Field | Description
|-|-
| `buckets` | Retrieve the list of buckets for each group.
| `members` | Retrieve the list of members for each group.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'groups/1.json?expand=buckets,members');
</code>
</pre>

# Search

**POST /groups/search.json**

Perform a search for group objects.

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
| `id` | integer
| `created` | timestamp
| `name` | string
| `updated` | timestamp
| `custom_*` | mixed | 

**expand**

|---
| Field | Description
|-|-
| `buckets` | Retrieve the list of buckets for each group.
| `members` | Retrieve the list of members for each group.

**subtotals[]**

|---
| Field | Description
|-|-
| `fieldsets` | Custom fieldsets on groups
| `links` | Objects linked to groups

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
     array('q','Support'),
     array('expand','buckets,members'),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'groups/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
     array('expand','buckets,members'),
     array('criteria[]','name'),
     array('oper[]','='),
     array('value[]','Support'),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'groups/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}