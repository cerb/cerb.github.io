---
title: Organizations
permalink: /docs/api/deprecated/organizations/
jumbotron:
  title: Organizations
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

<div class="cerb-box note">
<p>This module is deprecated as of <a href="/releases/8.2/">Cerb 8.2</a> and will be removed in a later version. You should use the <a href="/docs/api/modules/records/">/records</a> API instead.</p>
</div>

* TOC
{:toc}

# Create

**POST /orgs/create.json**

Create an organization object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `city` | string | 
| `country` | string | 
| `created` | timestamp
| `name` | string | **required**
| `phone` | string | 
| `postal` | string | 
| `province` | string | 
| `street` | string | 
| `updated` | timestamp
| `website` | string | 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('name','deCODE Genetics'),
);
$out = $cerb->post($base_url . 'orgs/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /orgs/`<id>`.json**

Retrieve an organization object.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'orgs/1.json');
</code>
</pre>

# Update

**PUT /orgs/`<id>`.json**

Update an organization object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `city` | string | 
| `country` | string | 
| `created` | timestamp
| `name` | string | 
| `phone` | string | 
| `postal` | string | 
| `province` | string | 
| `street` | string | 
| `updated` | timestamp
| `website` | string | 
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('street','1234 Main Street'),
    array('city','Anywhere'),
    array('province','California'),
    array('postal','99999'),
    array('country','United States'),
);
$out = $cerb->put($base_url . 'orgs/1.json', $postfields);
</code>
</pre>

# Search

**POST /orgs/search.json**

Perform a search for organization objects.

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
| `city` | string | 
| `country` | string | 
| `created` | timestamp
| `id` | integer | 
| `name` | string | 
| `phone` | string | 
| `postal` | string | 
| `province` | string | 
| `street` | string | 
| `updated` | timestamp
| `website` | string | 
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `country` | Orgs by country
| `fieldsets` | Custom fieldsets on orgs
| `links` | Objects linked to orgs
| `postal` | Orgs by postal code
| `province` | Orgs by state/province
| `watchers` | Watchers on orgs

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = array(
    array('q','Webgroup'),
    array('sortBy','name'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'orgs/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','name'),
    array('oper[]','like'),
    array('value[]','t*'),
    array('sortBy','name'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'orgs/search.json', $postfields);
</code>
</pre>

{% include api_toc.html %}