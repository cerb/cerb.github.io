---
title: Contacts
permalink: /docs/api/deprecated/contacts/
jumbotron:
  title: Contacts
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

**POST /contacts/create.json**

Create a contact object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `created_at` | timestamp | 
| `dob` | string | YYYY-MM-DD
| `email_id` | integer | 
| `first_name` | string | **required**
| `gender` | string | F=Female, M=Male, blank=Unknown
| `language` | string | en_US
| `last_name` | string | 
| `location` | string
| `mobile` | string
| `org_id` | integer
| `password` | string
| `phone` | string
| `timezone` | string | America/Los_Angeles
| `title` | string
| `updated_at` | timestamp
| `username` | string
| `custom_*`| mixed

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('email_id','1234'),
    array('password','s3cr3t'),
);
$out = $cerb->post($base_url . 'contacts/create.json', $postfields);
</code>
</pre>

# Retrieve

**GET /contacts/`<id>`.json**

Retrieve a contact object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'contacts/1.json');
</code>
</pre>

# Update

**PUT /contacts/`<id>`.json**

Update a contact object.

### Parameters
{: .no_toc}

|---
| Field | Type | 
|-|-|-
| `created_at` | timestamp
| `dob` | string | YYYY-MM-DD
| `email_id` | integer
| `first_name` | string | **required**
| `gender` | string | F=Female, M=Male, blank=Unknown
| `language` | string | en_US
| `last_name` | string
| `location` | string
| `mobile` | string
| `org_id` | integer
| `password` | string
| `phone` | string
| `timezone` | string | America/Los_Angeles
| `title` | string
| `updated_at` | timestamp
| `username` | string
| `custom_*` | mixed | 

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('password','new'),
);
$out = $cerb->put($base_url . 'contacts/1.json', $postfields);
</code>
</pre>

# Search

**POST /contacts/search.json**

Perform a search for contact objects.

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
| `created_at` | timestamp
| `custom_*` | mixed
| `dob` | string
| `email_id` | integer
| `first_name` | string
| `gender` | string
| `language` | string
| `last_name` | string
| `location` | string
| `mobile` | string
| `org_id` | integer
| `phone` | string
| `timezone` | string
| `title` | string
| `updated_at` | timestamp
| `username` | string

**subtotals[]**

|---
| Field | Description | 
|-|-|-
| `fieldsets` | Custom fieldsets on contacts
| `first_name` | Given name
| `gender` | Gender (F = Female, M = Male)
| `language` | Spoken language and dialect (e.g. en_US)
| `last_name` | Surname
| `links` | Objects linked to contacts
| `location` | Geographical location
| `org` | Organizational affiliation
| `timezone` | Timezone (e.g. America/Los_Angeles)
| `title` | Job title (e.g. VP of Engineering)
| `watchers` | Watchers on contacts

**Example:**

<pre>
<code class="language-php">
$postfields = array(
    array('q','Joe Customer'),
    array('sortBy','email'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'contacts/search.json', $postfields);
</code>
</pre>

<pre>
<code class="language-php">
$postfields = array(
    array('criteria[]','first_name'),
    array('oper[]','like'),
    array('value[]','jeff@*'),
    array('sortBy','email'),
    array('sortAsc','1'),
    array('page','1'),
);
$out = $cerb->post($base_url . 'contacts/search.json', $postfields);
</code>
</pre>

# Delete

**DELETE /contacts/`<id>`.json**

Delete a contact object.

**Example:**

<pre>
<code class="language-php">
$out = $cerb->delete($base_url . 'contacts/1.json');
</code>
</pre>

{% include api_toc.html %}