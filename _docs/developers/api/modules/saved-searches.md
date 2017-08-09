---
title: Saved Searches
permalink: /docs/api/modules/saved-searches/
jumbotron:
  title: Saved Searches
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

<div class="cerb-box note"><p>Saved searches are available from the API in <a href="/releases/8.1/"><b>Cerb 8.1</b></a> or later.</p></div>

# Create

**POST /saved_searches/create.json**

Create a saved search record.

### Parameters
{: .no_toc}

|---
| Field | Type | Required | 
|:-|:-|:-:|:-
| `context` | [context](/docs/api/modules/contexts/#list) | √ | 
| `name` | string | √
| `owner_context` | [context](/docs/api/modules/contexts/#list) | √
| `owner_context_id` | integer | √
| `query` | string | √
| `tag` | string | 
| `updated_at` | timestamp | 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['name', 'Available Workers'],
    ['context', 'cerberusweb.contexts.worker'],
    ['query', 'isAvailable:"now to +15 mins" isDisabled:n'],
    ['tag', 'available-workers'],
    ['owner_context', 'cerberusweb.contexts.app'],
    ['owner_context_id', '0'],
];
$out = $cerb->post($base_url . 'saved_searches/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /saved_searches/`<id>`.json**

Retrieve a saved search record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'saved_searches/1.json');
</code>
</pre>

# Update

**PUT /saved_searches/`<id>`.json**

Update a saved search record.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `context` | [context](/docs/api/modules/contexts/#list) | 
| `name` | string | 
| `owner_context` | [context](/docs/api/modules/contexts/#list) | 
| `owner_context_id` | integer | 
| `query` | string | 
| `tag` | string | 
| `updated_at` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['name', 'Available Workers'],
    ['query', 'isAvailable:"now to +15 mins" isDisabled:n'],
];
$out = $cerb->put($base_url . 'saved_searches/123.json', $postfields);
</code>
</pre>

# Delete

**DELETE /saved_searches/`<id>`.json**

Delete a saved search record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->delete($base_url . 'saved_searches/123.json');
</code>
</pre>

# Search

**POST /saved_searches/search.json**

Perform a search for saved search records.

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
| `context` | string | 
| `id` | integer | 
| `name` | string | 
| `updated_at` | timestamp | 
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `context` | Searches by record type
| `owners` | Searches by owner

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['q', 'tag:available* context:ticket'],
    ['sortBy', 'name'],
    ['sortAsc', '1'],
    ['page', '1'],
];
$out = $cerb->post($base_url . 'saved_searches/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}