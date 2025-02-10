---
title: 'Incremental quick search'
excerpt: Add new filters to a worklist using quick search without replacing the existing
  filters.
summary: This page provides a tip for using incremental quick search in Cerb to add
  new filters to an existing worklist without replacing the current filters. It explains
  how starting a quick search with a `+` allows users to append additional criteria
  to their existing search. An example is given where a user has a worklist filtered
  by open tickets linked to certain organizations and wants to further filter by tickets
  updated in the past year. By using the `+` prefix, users can efficiently refine
  their search results without losing the original filters.
layout: integration
author: The Cerb Team
date: "2017-02-17 10:30:00 -0700"
permalink: /tips/incremental-quick-search/
jumbotron:
  title: 'Incremental quick search'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---

You've probably noticed that when you quick search a [worklist](/docs/worklists/) it replaces the existing filters using the new query.  This is efficient and convenient when you want to change all of the filters at once.  Sometimes, however, you just want to add a few more filters and keep the existing ones.

To add new filters to a previously filtered worklist, start your quick search with `+`.

For instance, let's assume that you already have a [ticket](/docs/tickets/) worklist filtered by `status:o links.org:(Donter)` (open tickets linked to organizations matching _'Donter'_).  You want to further filter the results to only those updated in the past year, but you left the page and came back, and now the quick search field is empty.

<div class="cerb-screenshot">
<img src="/assets/images/tips/incremental-quick-search/existing-filters.png" class="screenshot">
</div>

You can use this quick search:

{% highlight cerb %}
+updated:"-1 year"
{% endhighlight %}

The worklist now has three filters:

<div class="cerb-screenshot">
<img src="/assets/images/tips/incremental-quick-search/new-filters.png" class="screenshot">
</div>
