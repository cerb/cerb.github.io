---
title: Search queries
excerpt: 
social_image_url: /assets/images/search/search.png
permalink: /docs/search/
toc:
  title: Queries
jumbotron:
  title: Search Queries
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

**Search queries** are a text-based language for filtering [records](/docs/records/). They are efficient, expressive, and automation-friendly.

Using queries, search functionality is consistent between [bots](/docs/bots/), [worklists](/docs/worklists/), [data queries](/docs/data-queries/), and [API requests](/docs/api/endpoints/records/#search).

As text, queries can be built dynamically using [bot scripting](/docs/bots/scripting/) syntax. They also simplify many complex operations that would otherwise be tedious (or impossible) to automate or represent with web-based forms.

To give you an idea of what you can do with queries, here's an example query that returns open tickets in the Sales or Support group that are less than a month old:

<pre>
<code class="language-cerb">
{% raw %}
status:open created:"-1 month" group:(sales OR support)
{% endraw %}
</code>
</pre>

In the following sections we'll cover query syntax and advanced functionality.

### Searching records

You can use the global search menu to filter any [record type](/docs/records/types/):

<div class="cerb-screenshot">
<img src="/assets/images/docs/search/search-menu.png" class="screenshot">
</div>

{% comment %}
* TOC
{:toc}

* choosers/search
* subtotals

Easy to share

The owner of a workspace can also add special **required query** to a worklist that cannot be changed by other users of the worklist.

For instance, if a worklist is meant to only show open conversations from clients with a service level agreement, then no additional filtering can change that constraint.  Every other filter will act only against those matching records.
{% endcomment %}