---
title: Feedback
permalink: /docs/api/modules/feedback/
jumbotron:
  title: Feedback
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Create

**POST /feedback/create.json**

Create a new feedback object.

|---
| Field | Type | 
|-|-|-
| `author_address` | string
| `created` | timestamp
| `quote_mood` | string | `praise`, `neutral`, `criticism`
| `quote_text` | string
| `url` | string
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('quote_text','This is the best app ever!'),
    array('author_address','happy-user@example.com'),	
);
$out = $cerb->post($base_url . 'feedback/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /feedback/`<id>`.json**

Retrieve a feedback object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'feedback/1.json');
</code>
</pre>

# Update

**PUT /feedback/`<id>`/xml**

Update a feedback object.

|---
| Field | Type | 
|-|-|-
| `author_address` | string
| `created` | timestamp
| `quote_mood` | string | `praise`, `neutral`, `criticism`
| `quote_text` | string
| `url` | string
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('url','http://www.google.com/'),
    array('quote_mood','praise'),
);
$out = $cerb->put($base_url . 'feedback/1.json', $postfields);
</code>
</pre>

# Search

**POST /feedback/search.json**

Perform a search for feedback objects.

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
| `author_address` | string
| `created` | timestamp
| `quote_mood` | string | `praise`, `neutral`, `criticism`
| `quote_text` | string
| `url` | string
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `author_address` | Author email address
| `fieldsets` | Custom fieldsets on feedback
| `quote_mood` | Feedback sentiment (e.g. praise, criticism)
| `watchers` | Watchers on feedback

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','mood:praise'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'feedback/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','author_address'),
    array('oper[]','like'),
    array('value[]','a*'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'feedback/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}