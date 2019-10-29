---
title: "Data Queries: Worklist Records"
excerpt: 
permalink: /docs/data-queries/worklist/records/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Worklist Records
jumbotron:
  title: Worklist Records
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# worklist.records
{: .no_toc}

`worklist.records` [data queries](/docs/data-queries/) retrieve record dictionaries with a [search query](/docs/search/).

<pre>
<code class="language-cerb">
{% raw %}
type:worklist.records
of:ticket
expand:[group_,custom_]
query:(
  status:open
  limit:10
  sort:-updated
)
format:dictionaries
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# of:

The `of:` key specifies the type of [records](/docs/records/) to retrieve.

<pre>
<code class="language-cerb">
{% raw %}
of:ticket
{% endraw %}
</code>
</pre>

# query:

The `query:` key specifies the [query](/docs/search/) for filtering the results.

# query.required:

The `query.required:` key specifies the required [query](/docs/search/) for filtering the results. This is used to set the scope and should never contain placeholders with user input.

# expand:

The `expand:` key specifies which key paths should be expanded in the results.

<pre>
<code class="language-cerb">
{% raw %}
expand:[custom_,group_,owner_]
{% endraw %}
</code>
</pre>

# page:

The `page:` key specifies the page to return. Pages numbering is zero-based. This is used by functionality like [sheets](/docs/sheets/).

# format:

The worklist results can be returned in these formats:

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

# Examples

## Return a stacked bar chart of tickets by owner by status

<pre>
<code class="language-cerb">
type:worklist.records
of:ticket
query:(status:open owner.id:me)
expand:[group_,owner_]
format:dictionaries
</code>
</pre>

<div class="cerb-screenshot">
<img src="/assets/images/docs/data-queries/data-queries-worklist-records-tickets.png" class="screenshot">
</div>
