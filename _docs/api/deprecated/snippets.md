---
title: Snippets
permalink: /docsRefer to the [/records](/docs/api/endpoints/records/) API endpoint.snippets/
jumbotron:
  title: Snippets
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

<div class="cerb-box note"><p>Snippets are available from the API in <a href="/releases/8.1/"><b>Cerb 8.1</b></a> or later.</p></div>

# Create

**POST /snippets/create.json**

Create a snippet record.

### Parameters
{: .no_toc}

|---
| Field | Type | Required | 
|:-|:-|:-:|:-
| `content` | string | √
| `context` | [context](/docs/api/endpoints/contexts/#list) | √
| `owner_context` | [context](/docs/api/endpoints/contexts/#list) | √
| `owner_context_id` | integer | √
| `title` | string | √
| `updated_at` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
{% raw %}
$postfields = [
    ['title', 'Ticket summary'],
    ['content' "Mask: {{mask}}\r\nSubject: {{subject}}\r\nGroup: {{group__label}}\r\nBucket: {{bucket__label}}\r\n"],
    ['context', 'cerberusweb.contexts.ticket'],
    ['owner_context', 'cerberusweb.contexts.app'],
    ['owner_context_id', '0'],
];
$out = $cerb->post($base_url . 'snippets/create.json', $postfields);
{% endraw %}
</code>
</pre>

# Retrieve

**GET /snippets/`<id>`.json**

Retrieve a snippet record.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `context_id` | (optional) Return parsed `content` using this record ID to fill in placeholders | integer
| `prompts[]` | (optional) Return parsed `content` using these prompted placeholder values. Example: `prompts[name]=Kina` | array

### Example: Get raw snippet
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'snippets/1.json');
</code>
</pre>

### Example: Get parsed snippet
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'snippets/1.json?context_id=123&prompts[name]=Kina');
</code>
</pre>

# Update

**PUT /snippets/`<id>`.json**

Update a snippet record.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `content` | string | 
| `context` | [context](/docs/api/endpoints/contexts/#list) | 
| `owner_context` | [context](/docs/api/endpoints/contexts/#list) | 
| `owner_context_id` | integer | 
| `title` | string | 
| `updated_at` | timestamp
| `custom_*` | mixed | 

### Example
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['title', 'New snippet title'],
    ['updated_at', 'now'],
];
$out = $cerb->put($base_url . 'snippets/123.json', $postfields);
</code>
</pre>

# Delete

**DELETE /snippets/`<id>`.json**

Delete a snippet record.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->delete($base_url . 'snippets/123.json');
</code>
</pre>

# Search

**POST /snippets/search.json**

Perform a search for snippet records.

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
| `context` | string | 
| `id` | integer | 
| `title` | string | 
| `updated_at` | timestamp | 
| `custom_*` | mixed | 

**subtotals[]**

|---
| Field | Description
|-|-
| `context` | Searches by record type
| `owners` | Searches by owner

### Examples
{: .no_toc}

<pre>
<code class="language-php">
$postfields = [
    ['q', 'title:sales* context:ticket'],
    ['sortBy', 'title'],
    ['sortAsc', '1'],
    ['page', '1'],
];
$out = $cerb->post($base_url . 'snippets/search.json', $postfields);
</code>
</pre>
