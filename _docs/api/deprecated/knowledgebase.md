---
title: Knowledgebase Articles
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.knowledgebase/
jumbotron:
  title: Knowledgebase Articles
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

**POST /kbarticles/create.json**

Create a knowledgebase article object.

### Parameters
{: .no_toc}

|---
| Field | Type | Notes
|-|-|-
| `category_id[]` | integer | prefix with `+` to add, `-` to remove
| `content` | string | **required**
| `format` | integer: | plaintext=`0`, html=`1`, markdown=`2`
| `title` | string | **required**
| `updated` | timestamp
| `views` | integer
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('title','New KB Article'),
    array('content',"#Header#\n\n**BOLD**\n\n_Italics_\n\nSome list\n\n1. One\n1. Two\n1. Three\n"),
    array('format',"2"),
    array('category_id[]','+661'),
    array('category_id[]','662'),
);
$out = $cerb->post($base_url . 'kbarticles/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /kbarticles/`<id>`.json**

Retrieve a knowledgebase article object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'kbarticles/4.json');
</code>
</pre>

# Update

**PUT /kbarticles/`<id>`.json**

Update a knowledgebase article object.

|---
| Field | Type | 
|-|-|-
| `category_id[]` | integer | prefix with `+` to add, `-` to remove
| `content` | string | Use `oper[]=fulltext`
| `format` | integer: | plaintext=0, html=1, markdown=2
| `title` | string
| `updated` | timestamp
| `views` | integer
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('title','New KB Article Title via API'),
    array('views','100'),
    array('content',"<h1>Header</h1><br><b>BOLD</b><br><i>Italics</i><br>Some list<br><ol><li>One</li><li>Two</li><li>Three</li></ol>"),
    array('format',"1"),
    array('category_id[]','-661'),
    array('category_id[]','+662'),
);
$out = $cerb->put($base_url . 'kbarticles/1.json', $postfields);
</code>
</pre>

# Search

Perform a search for knowledgebase article objects.

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
| `category_id` | integer
| `content` | string
| `format` | integer
| `id` | integer
| `title` | string
| `updated` | timestamp
| `views` | integer
| `custom_*` | mixed

**subtotals[]**

|---
| Field | Type | 
|-|-|-
| `fieldsets` | Custom fieldsets on article objects
| `format` | Article markup format
| `links` | Objects linked to articles
| `topic` | Knowledgebase topic parent
| `watchers` | Watchers on articles

**Examples:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','CentOS install'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'kbarticles/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','content'),
    array('oper[]','fulltext'),
    array('value[]','+html +header1'),
    array('sortBy','id'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'kbarticles/search.json', $postfields);
</code>
</pre>
