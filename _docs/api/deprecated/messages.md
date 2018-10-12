---
title: Messages
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.messages/
jumbotron:
  title: Messages
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

# Retrieve

**GET /messages/`<id>`.json**

Retrieve a message object.

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
| `attachments` | Retrieve attachment information
| `content` | Retrieve full message content
| `content_html` | Retrieve HTML message content
| `headers` | Retrieve all message email headers

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'messages/1.json?expand=content,headers');
</code>
</pre>

# Search

**POST /messages/search.json**

Perform a search for message objects.

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

**expand**

|---
| Field | Type | 
|-|-|-
| `content` | Retrieve full message content
| `content_html` | Retrieve HTML message content
| `headers` | Retrieve all message email headers

**sortBy**

|---
| Field | Type | 
|-|-|-
| `id` | integer
| `created` | timestamp
| `content` | string | Use `oper[]=fulltext`
| `sender_id` | integer
| `ticket_id` | integer

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `is_broadcast` | Messages by broadcast flag
| `is_outgoing` | Messages by incoming/outgoing
| `sender_address` | Messages by sender email
| `ticket_group` | Messages by group/bucket
| `ticket_status` | Messages by parent ticket status
| `worker` | Messages by worker sender

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','email receipt'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'messages/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','ticket_id'),
    array('oper[]','='),
    array('value[]','61'),
    array('criteria[]','content'),
    array('oper[]','fulltext'),
    array('value[]','toys'),
    array('sortBy','created'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'messages/search.json', $postfields);
</code>
</pre>
