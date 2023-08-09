---
title: Records
permalink: /docs/api/endpoints/records/
toc:
  title: Modifying Records
  expand: API
jumbotron:
  title: Records
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
  -
    label: Endpoints &raquo;
    url: /docs/api/endpoints/
---

The **records** API can abstractly create, retrieve, update, upsert, search, and delete all records in Cerb from a single [endpoint](/docs/api/endpoints/).

This endpoint target a specific [record type](/docs/records/types/) as `<uri>` in the path.

* TOC
{:toc}

# Retrieve

**GET /rest/records/`<uri>`/`<id>`.json**

Retrieve a record [dictionary](/docs/guide/developers/dictionaries/).

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'records/asset/1.json');
</code>
</pre>

# Create

**POST /rest/records/`<uri>`/create.json**

Create a new record.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found on each [record type](/docs/records/types/).

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

**PUT /rest/records/`<uri>`/`<id>`.json**

Update a record object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found on each [record type](/docs/records/types/).

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

**PATCH /rest/records/`<uri>`/upsert.json**

Update an existing record if matched, or create a new record otherwise.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `fields[]` | mixed | **required** This field can be provided multiple times for each field to set. The field names are found on each [record type](/docs/records/types/).
| `query` | string | The [search query](/docs/search/) for detecting a match. This must return either `0` (create) or `1` (update) results. Anything else returns an error.

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

**GET /rest/records/`<uri>`/search.json**

Search for matching records.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string
| `limit` | The number of results to display per page | integer
| `page` | The page of results to display given limit | integer
| `q` | Filters to add using a [search query](/docs/search/) | string
| `subtotals[]` | Multiple subtotal sets can be returned | string 

**expand**
	
Includes additional information in the response. These options vary depending on the [record type](/docs/records/types/).

|---
| Field | Description
|-|-
| `custom_` | Include custom field values for each ticket.
| `watchers` | Include watcher records for each ticket.

**subtotals[]**

Return subtotal results based on the given fields. These options vary depending on the [record type](/docs/records/types/).

### Example
{: .no_toc}

<pre>
<code class="language-php">
$query = http_build_query([
  'q' => 'mimetype:"image/png" size:>200kb sort:-size page:1',
]);

$out = $cerb->get($base_url . 
  'records/attachments/search.json?' .
  $query
);
</code>
</pre>

# Delete

**DELETE /rest/records/`<uri>`/`<id>`.json**

Delete a record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->delete($base_url . 'records/call/1.json');
</code>
</pre>

# Links

You can create record [links](/docs/records/fields/types/links/) with the `links` field key in a create, update, or upsert request.

The value must be a `context:id` tuple identifying the record to link to.

The key can be provided multiple times to link multiple records. Be sure to append `[]` to the field key, like the example below.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['fields[links][]', 'org:123'],
    ['fields[links][]', 'ticket:456'],
];
$out = $cerb->put($base_url . 'records/task/1.json', $postfields);
</code>
</pre>

## Unlink

You can remove record links by prefixing the tuple with a `-` (dash).

You may mix link additions and removals in the same request.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['fields[links][]', '-org:123'],
    ['fields[links][]', 'ticket:456'],
];
$out = $cerb->put($base_url . 'records/task/1.json', $postfields);
</code>
</pre>
