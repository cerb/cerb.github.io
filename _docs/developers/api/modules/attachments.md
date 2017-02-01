---
title: Attachments
permalink: /docs/api/modules/attachments/
jumbotron:
  title: Attachments
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Retrieve

**GET /attachments/`<id>`.json**

Retrieve an attachment object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'attachments/1.json');
</code>
</pre>
	
# Download

**GET /attachments/`<id>`/download.json**

Download an attachment.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'attachments/1/download.json');
</code>
</pre>

# Upload

**POST /attachments/upload.json**

Upload an attachment object.

|---
| Field | Type |
|-|-|-
| `content` | string| **required**
| `encoding` | string | `text` or `base64`
| `file_name` | string | **required**
| `mime_type` | string | **required**

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('file_name','test.txt'),
    array('mime_type','text/plain'),
    array('encoding','text'), // text, base64
    array('content','These are the file contents'),
);
$out = $cerb->post($base_url . 'attachments/upload.json', $postfields);
</code>
</pre>

Using base64 encoding for binary files:

<pre>
<code class="language-php">
$postfields = array(
    array('file_name','image.png'),
    array('mime_type','image/png'),
    array('encoding','base64'), // text, base64
    array('content',base64_encode(file_get_contents('/path/to/image.png'))),
);
$out = $cerb->post($base_url . 'attachments/upload.json', $postfields);
</code>
</pre>

# Search

**POST /attachments/search.json**

Perform a search for attachment objects.

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
| `context` | string
| `context_id` | integer
| `display_name` | string
| `guid` | string
| `id` | integer
| `mime_type` | string
| `sha1_hash` | string
| `size` | integer
| `storage_extension` | string
| `storage_key` | string
| `storage_profile_id` | integer
| `updated` | timestamp

**subtotals[]**

|---
| Key | Description
|-|-
| `display_name` | File name
| `mime_type` | MIME type
| `storage_extension` | Storage engine (e.g. disk, database, S3)

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','*.zip'),
    array('expand','attachment_'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'attachments/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('expand','attachment_'),
    array('criteria[]','id'),
    array('oper[]','='),
    array('value[]','116'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'attachments/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}