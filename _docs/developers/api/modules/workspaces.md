---
title: Workspaces
permalink: /docs/api/modules/workspaces/
jumbotron:
  title: Workspaces
  tagline: ""
  breadcrumbs:
  -
    label: Developers &raquo; API
    url: /docs/api/
---

* TOC
{:toc}

# List Pages

**GET /workspaces/pages/list.json**

Retrieve the workspace pages accessible by the current worker.  This includes pages owned by the worker, their groups, or roles.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `owner` | Retrieve owner records
| `tabs` | Retrieve tabs for each page
| `widgets` | Retrieve widgets for each tab. This automatically includes `tabs`
| `worklists` | Retrieve worklists for each tab. This automatically includes `tabs`

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workspaces/list.json?expand=owner,widgets');
</code>
</pre>

# Retrieve Page

**GET /workspaces/pages/123.json**

Retrieve a workspace page object.

### Parameters
{: .no_toc}

**Parameters:**

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `owner` | Retrieve owner records
| `tabs` | Retrieve tabs for each page
| `widgets` | Retrieve widgets for each tab. This automatically includes `tabs`
| `worklists` | Retrieve worklists for each tab. This automatically includes `tabs`

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workspaces/pages/123.json?expand=worklists,widgets');
</code>
</pre>

# Retrieve Tab

**GET /workspaces/tabs/123.json**

Retrieve a workspace tab object.

### Parameters
{: .no_toc}

|---
| Field | Description | Type
|-|-|-
| `expand` | The keys to expand for each object as a comma-separated list | string

**expand**
	
Includes additional information in the response.  The following tokens may be provided in a comma-separated list:

|---
| Field | Description
|-|-
| `widgets` | Retrieve all widgets on this tab.
| `widgets_data` | Retrieve all widgets on this tab including their current data. This is useful for external monitoring and reporting. This automatically includes `widgets`.
| `worklists` | Retrieve all worklists on this tab.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workspaces/tabs/123.json?expand=widgets_data');
</code>
</pre>

# Retrieve Widget

**GET /workspaces/widgets/123.json**

Retrieve a workspace widget object.  This automatically includes the widget's current data.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workspaces/widgets/123.json');
</code>
</pre>

# Retrieve Worklist

**GET /workspaces/worklists/123.json**

Retrieve a workspace worklist object.  This automatically includes the worklist's current results, which may be paged like a search.

### Parameters
{: .no_toc}

|---
| Field | Description | 
|-|-|-
| `expand` | A comma-separated list of additional keys to retrieve.  Available options generally have a `__context` suffix in the results.  For example `?expand=group` would retrieve all the `group_*` keys on a ticket worklist by expanding the `group__context` key.
| `page` | The page of results to retrieve, starting with 1.
| `limit` | The number of results per page.  Accepts values from 1 to 100.

### Example
{: .no_toc}

<pre>
<code class="language-php">
$out = $cerb->get($base_url . 'workspaces/worklists/123.json?page=1&limit=5');
</code>
</pre>

{% include api_toc.html %}