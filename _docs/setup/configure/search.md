---
title: Search
excerpt: This page discusses the implementation of full-text search filters in Cerb
  worklists, which allow users to search record content using specific terms and phrases.
summary: This page discusses the implementation of full-text search filters in Cerb
  worklists, which allow users to search record content using specific terms and phrases.
  It explains that while MySQL's FULLTEXT indexes are used by default and optimized
  for efficiency, they may not be ideal for larger environments. For scalability,
  the page suggests switching to more robust search engines like Elasticsearch or
  Sphinx, which offer faster performance and greater control over content indexing,
  albeit requiring additional service management.
permalink: /docs/setup/configure/search/
toc:
  expand: Admin Guide
jumbotron:
  title: Search
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Setup &raquo;
    url: /docs/setup/
  - label: Configure &raquo;
    url: /docs/setup/#configure
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/search.png" class="screenshot">
</div>

Many [worklists](/docs/worklists/) provide a full-text[^fts] search [filter](/docs/workspaces/#filters) to match [record](/docs/records/) content based on terms and phrases.

For instance, you may need to search your email history for the phrase: `"facebook ads" receipt`.

By default, these searches are implemented as `FULLTEXT` indexes in MySQL[^mysql-fulltext].  We've done a lot of optimization to keep these searches efficient, and it _"just works"_.  However, MySQL isn't an optimal search engine for larger environments.

As you [scale](/docs/scaling/), you may decide to switch to Elasticsearch or Sphinx. We support both.  These options require you to manage an additional service, but they're much faster and provide you with more control over how your content is indexed.


# References

[^fts]: <https://en.wikipedia.org/wiki/Full-text_search>

[^mysql-fulltext]: <http://dev.mysql.com/doc/refman/5.7/en/fulltext-search.html>