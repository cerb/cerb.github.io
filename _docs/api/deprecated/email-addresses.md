---
title: Email Addresses
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.email-addresses/
jumbotron:
  title: Email Addresses
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

**GET /addresses/`<id>`.json**

Retrieve an email address object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'addresses/1.json');
</code>
</pre>

# Create

**POST /addresses/create.json**

Create a new email address object using the following fields:

|---
| Field | Type | 
|-|-|-
| `email` | string | **required**
| `is_banned` | bit
| `is_defunct` | bit
| `org_id` | integer
| `updated` | timestamp
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('email','gaius.baltar@localhost'),
    array('custom_16','https://cerb.ai/'),
);
$out = $cerb->post($base_url . 'addresses/create.json', $postfields);
</code>
</pre>

# Update

**PUT /addresses/`<id>`.json**

Update an existing email address object using any of the following fields:

|---
| Field | Type | 
|-|-|-
| `is_banned` | bit
| `is_defunct` | bit
| `org_id` | integer
| `updated` | timestamp
| `custom_*` | mixed |

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('email','gaius.baltar@cerberusdemo.com'),
    array('custom_16','https://cerb.ai/'),
);
$out = $cerb->post($base_url . 'addresses/1.json', $postfields);
</code>
</pre>

# Search

**POST /addresses/search.json**

Perform a search for address objects.

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
| `email` | string
| `is_banned` | bit
| `is_defunct` | bit
| `num_nonspam` | integer
| `num_spam` | integer
| `org_id` | integer
| `org_name` | string
| `updated` | timestamp
| `custom_*` | mixed |

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `fieldsets` | Custom fieldsets on the addresses
| `is_banned` | Whether senders are banned or not
| `is_defunct` | Whether senders are defunct or not
| `links` | Objects linked to addresses
| `org_name` | Contact organization name
| `watchers` | Watchers on addresses

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','jeff@'),
    array('sortBy','email'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'addresses/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','org_id'),
    array('oper[]','='),
    array('value[]','1'),
    array('criteria[]','is_banned'),
    array('oper[]','='),
    array('value[]','0'),
    array('criteria[]','email'),
    array('oper[]','like'),
    array('value[]','jeff@*'),
    array('sortBy','email'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'addresses/search.json', $postfields);</code>
</pre>
