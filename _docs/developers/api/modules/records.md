---
title: Records
permalink: /docs/api/modules/records/
jumbotron:
  title: Records
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

The **records** API can abstractly create, retrieve, update, upsert, and search all record types in Cerb from a single endpoint. Over the course of the next few releases this API will replace the standalone endpoints.

These endpoints specify a record `<uri>` in the path. You can use any `alias` from [/contexts/list](/docs/api/modules/contexts/#list).

* TOC
{:toc}

<div class="cerb-box note">
<p>This API is available in <a href="/releases/8.2"><b>Cerb 8.2</b></a> or later.</p>
</div>

# Retrieve

**GET /records/`<uri>`/`<id>`.json**

Retrieve a record object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'records/asset/1.json');
</code>
</pre>

# Create

**POST /records/`<uri>`/create.json**

Create a record object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found when [retrieving](#retrieve) a record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['expand','custom_'],
    ['fields[email]','customer@cerb.example'],
    ['fields[is_banned]','0'],
    ['fields[custom_123]','Some value'],
];
$out = $cerb->post($base_url . 'records/address/create.json', $postfields);
</code>
</pre>

# Update

**PUT /records/`<uri>`/`<id>`.json**

Update a record object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found when [retrieving](#retrieve) a record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['fields[is_private]','0'],
    ['fields[name]','Support'],
    ['fields[reply_personal]','Example Support Team'],
];
$out = $cerb->put($base_url . 'records/group/1.json', $postfields);
</code>
</pre>

# Upsert

**PATCH /records/`<uri>`/upsert.json**

Update an existing record if matched, or create a new record otherwise.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found when [retrieving](#retrieve) a record.
| `query` | string | The quick search query for detecting a match. This must return either `0` (create) or `1` (update) results. Anything else returns an error.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['fields[country]','United States'],
    ['fields[name]','Apple, Inc.'],
    ['fields[website]','https://apple.com'],
    ['query', 'name:"Apple, Inc."'],
];
$out = $cerb->patch($base_url . 'records/org/upsert.json', $postfields);
</code>
</pre>

# Search

**POST /records/`<uri>`/search.json**

Search for record objects.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string
| `limit` | The number of results to display per page | integer
| `page` | The page of results to display given limit | integer
| `q` | Filters to add using quick search syntax | string
| `subtotals[]` | Multiple subtotal sets can be returned | string 

**expand**
	
Includes additional information in the response. These options vary depending on the record type.

|---
| Field | Description
|-|-
| `custom_` | Include custom field values for each ticket.
| `watchers` | Include watcher records for each ticket.

**subtotals[]**

Return subtotal results based on the given fields. These options vary depending on the record type.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','mimetype:"image/png" size:>200kb sort:-size'),
    array('sortBy','size'),
    array('sortAsc','0'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'records/attachments/search.json', $postfields);
</code>
</pre>

# Delete

**DELETE /records/`<uri>`/`<id>`.json**

Delete a record object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->delete($base_url . 'records/call/1.json');
</code>
</pre>

{% include api_toc.html %}