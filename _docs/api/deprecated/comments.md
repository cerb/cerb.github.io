---
title: Comments
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.comments/
jumbotron:
  title: Comments
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

**POST /comments/create.json**

Create a comment record.

**Parameters:**

|---
| Field | Type | 
|-|-|-
| `comment` | string | **required**
| `context_id` | integer | **required**
| `context` | string | **required**
| `created` | timestamp | 
| `file_id[]` | array | 
| `owner_context_id` | integer | **required**
| `owner_context` | string | **required**

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('expand', 'author_label,author_type,record_label,record_type'),
    array('context', 'cerberusweb.contexts.ticket'),
    array('context_id', 1),
    array('owner_context', 'cerberusweb.contexts.address'),
    array('owner_context_id', 123),
    array('comment', 'This is a comment'),
    array('file_id[]', 123),
    array('file_id[]', 456),
);
$out = $cerb->post($base_url . 'comments/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /comments/`<id>`.json**

Retrieve a comment object.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `attachments` | Retrieve attachment records for each comment.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'comments/1.json?expand=author_label,author_type,record_label,record_type');
</code>
</pre>

# Search

**POST /comments/search.json**

Perform a search for comment objects.

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
| Field | Type
|-|-
| `id` | integer
| `context` | string
| `context_id` | integer
| `owner_context` | string
| `owner_context_id` | integer
| `comment` | string
| `created` | timestamp


**subtotals[]**

|---
| Key | Description
|-|-
| `fieldsets` | Custom fieldsets on the comments
| `owner` | Comment author
| `target` | The object containing the comment

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('expand', 'author_label,author_type,record_label,record_type,attachments'),
    array('q','@Hildy'),
);
$out = $cerb->post($base_url . 'comments/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('expand', 'author_label,author_type,record_label,record_type,attachments'),
    array('criteria[]','context'),
    array('oper[]','='),
    array('value[]','cerberusweb.contexts.ticket'),
    array('criteria[]','context_id'),
    array('oper[]','='),
    array('value[]','1'),
);
$out = $cerb->post($base_url . 'comments/search.json', $postfields);
</code>
</pre>
