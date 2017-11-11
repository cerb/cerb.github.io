---
title: Domains
permalink: /docs/api/deprecated/domains/
jumbotron:
  title: Domains
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

Create
======

**POST /domains/create.json**

Create a domain object.

|---
| Field | Type | 
|-|-|-
| `created` | timestamp
| `name` | string
| `server_id` | integer
| `custom_*` | mixed

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('name','site.example.com'),
    array('server_id', 123),
);
$out = $cerb->post($base_url . 'domains/create.json', $postfields);
</code>
</pre>

Retrieve
========

**GET /domains/`<id>`.json**

Retrieves a domain object.

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
| Field | Description
|-|-|-
| `contacts` | Retrieve full contacts list for each domain.
| `contacts_list` | Retrieve comma-separated contacts list for each domain.
| `watchers` |  Retrieve watchers list for each domain.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'domains/1.json?expand=contacts');
</code>
</pre>

Update
======
**PUT /domains/`<id>`.json**

Update a domain object.

|---
| Field | Type | 
|-|-|-
| `created` | timestamp
| `name` | string
| `server_id` | integer
| `custom_*` | mixed

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('server_id', 456),
);
$out = $cerb->put($base_url . 'domains/1.json', $postfields);
</code>
</pre>

# Search

**POST /domains/search.json**

Perform a search for domain objects.

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
| `created` | timestamp
| `name` | string
| `server_id` | integer
| `custom_*` | mixed

**expand**

|---
| Field | Description
|-|-
| `contacts` | Retrieve full contacts list for each domain.
| `contacts_list` | Retrieve comma-separated contacts list for each domain.
| `watchers` | Retrieve watchers list for each domain.

**subtotals[]**

|---
| Field | Description | 
|-|-|-
| `fieldsets` | Custom fieldsets on the domains
| `links` | Objects linked to domains
| `server` | Parent server object
| `watchers` | Watchers on domains

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
     array('q','Hades'),
     array('expand','server_'),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'domains/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
     array('expand','server_'),
     array('criteria[]','server_id'),
     array('oper[]','='),
     array('value[]',123),
     array('sortBy','name'),
     array('sortAsc','1'),
     array('page','1'),
);
$out = $cerb->post($base_url . 'domains/search.json', $postfields);
</code>
</pre>

# Contacts

**POST /domains/123/contacts.json**

Add or remove contacts on a domain object.  The contacts can be specified by email address, ID, or any combination of both.

### Parameters
{: .no_toc}

|---
| Field | Description
|-|-
| `mode` | Either `add` or `remove`
| `emails` | A comma-separated list of email addresses to add or remove
| `ids` | A comma-separated list of email address IDs to add or remove

**Example:**

<pre>
<code class="language-php">
$postfields = array(
	array('mode','add'),
	array('emails','jeff@example.com,darren@example.com'),
	array('ids','1'),
);
$out = $cerb->post($base_url . 'domains/123/contacts.json', $postfields);
</code>
</pre>

{% include api_toc.html %}