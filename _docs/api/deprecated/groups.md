---
title: Groups
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.groups/
jumbotron:
  title: Groups
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/endpoints/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# Create

**POST /groups/create.json**

Create a group object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `name` | string
| `is_private` | bit | `0`=public, `1`=private
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
  array('name', 'Quality Assurance'),
  array('is_private', 0),
);
$out = $cerb->post($base_url . 'groups/create.json', $postfields);
</code>
</pre>

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

# Update

**PUT /groups/`<id>`.json**

Update a group object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `name` | string
| `is_private` | bit | `0`=public, `1`=private
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('name','Quality Assurance'),
);
$out = $cerb->put($base_url . 'groups/123.json', $postfields);
</code>
</pre>

# Members

**PUT /groups/members.json**

Modify group rosters.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `json` | changes string in JSON format

### Example
{: .no_toc}

<pre>
<code class="language-php">
$changes = [
  "groups" => [
    "1" => [
      "workers" => [
        "1" => "manager",
        "2" => "remove",
        "3" => "member",
      ],
    ],
    "2" => [
      "workers" => [
        "2" => "remove",
      ],
    ],
  ],
];

$postfields = array(
    array('json', json_encode($changes)),
);
$out = $cerb->put($base_url . 'groups/123.json', $postfields);
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
     array('q','name:Support'),
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
