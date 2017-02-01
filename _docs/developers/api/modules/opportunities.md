---
title: Opportunities
permalink: /docs/api/modules/opportunities/
jumbotron:
  title: Opportunities
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# Create

**POST /opps/create.json**

Create an opportunity object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `amount` | float
| `created` | timestamp
| `email_address` | string | **required**, or `email_id`
| `email_id` | integer | **required**, or `email_address`
| `is_closed` | bit
| `is_won` | bit
| `title` | string | **required**
| `updated` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('title','Sell Cerb to Salesforce'),
    array('email_address','unlikely@example.com'),
);
$out = $cerb->post($base_url . 'opps/create.json', $postfields);
</code>
</pre>

# Update

**PUT /opps/`<id>`.json**

Update an opportunity object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `amount` | float
| `created` | timestamp
| `email_address` | string
| `email_id` | integer
| `is_closed` | bit
| `is_won` | bit
| `title` | string
| `updated` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('title','Sell Cerb to Atlassian'),
    array('email_address','not_happening@example.com'),
);
$out = $cerb->post($base_url . 'opps/1.json', $postfields);
</code>
</pre>

# Retrieve

**GET /opps/`<id>`.json**

Retrieve an opportunity object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'opps/1.json');
</code>
</pre>

# Search

**POST /opps/search.json**

Perform a search for opportunity records.

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
| `amount` | float
| `created` | timestamp
| `email_address` | string
| `email_id` | integer
| `is_closed` | bit
| `is_won` | bit
| `title` | string
| `updated` | timestamp
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description 
|-|-
| `email_address` | Opps by contact email
| `email_is_defunct` | Opps by contact defunct flag
| `email_first_name` | Opps by contact first name
| `email_last_name` | Opps by contact last name
| `fieldsets` | Custom fieldsets on the opps
| `is_closed` | Opps by closed status
| `is_won` | Opps by won status
| `links` | Objects linked to opps
| `org` | Opps by contact org
| `watchers` | Watchers on opps

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','isWon:y updated:"-1 week"'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'opps/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','is_closed'),
    array('oper[]','='),
    array('value[]','0'),
    array('criteria[]','title'),
    array('oper[]','like'),
    array('value[]','hu*'),
    array('criteria[]','email_address'),
    array('oper[]','like'),
    array('value[]','*.de'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'opps/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}