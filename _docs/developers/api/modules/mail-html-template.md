---
title: Mail HTML Templates
permalink: /docs/api/modules/mail-html-template/
jumbotron:
  title: Mail HTML Templates
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Create

**POST /mail_html_templates/create.json**

Create a mail HTML template object.

|---
| Field | Type | 
|-|-|-
| `content` | string | 
| `name` | string	 | **required**
| `signature` | 	string
| `updated_at` | timestamp
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('name', 'Urgent template'),
    array('content', '<div id="body">{{message_body}}</div><style type="text/css">#body { color: red; }</style>'),
    array('signature', '-- {{full_name}}, Company Inc.'),
);
$out = $cerb->post($base_url . 'mail_html_templates/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /mail_html_templates/`<id>`.json**

Retrieve a mail HTML template object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'mail_html_templates/1.json');
</code>
</pre>

# Update

**PUT /mail_html_templates/`<id>`.json**

Update a mail HTML template object.

|---
| Field | Type | 
|-|-|-
| `content` | 	string
| `name` | string
| `signature` | 	string
| `updated_at` | timestamp
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('name','Sales Newsletter'),
);
$out = $cerb->put($base_url . 'mail_html_templates/123.json', $postfields);
</code>
</pre>

# Search

**POST /mail_html_templates/search.json**

Perform a search for mail HTML template objects.

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
| `content` | 	string
| `id` | 	id
| `name` | string
| `signature` | 	string
| `updated_at` | timestamp
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `fieldsets` | Custom fieldsets on the addresses
| `links` | Objects linked to addresses
| `watchers` | Watchers on addresses

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','Sales'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'mail_html_templates/search.json', $postfields);    
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','name'),
    array('oper[]','like'),
    array('value[]','sales*'),
    array('criteria[]','watchers'),
    array('oper[]','in'),
    array('value[]','[1,2,3]'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'mail_html_templates/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}