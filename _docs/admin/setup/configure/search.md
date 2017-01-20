---
title: Search
permalink: /docs/setup/search/
jumbotron:
  title: Search
  breadcrumbs:
  - 
    label: Setup
    url: /docs/setup/
---

Navigate to **Setup** >> **Configure** >> **Search**

<div class="cerb-screenshot">
<img src="/assets/images/docs/setup/search.png" class="screenshot">
</div>

Many [worklists](/docs/workspaces/#worklists) provide a full-text[^fts] search [filter](/docs/workspaces/#filters) to match [record](/docs/records/) content based on terms and phrases.

For instance, you may need to search your email history for the phrase: `"facebook ads" receipt`.

By default, these searches are implemented as `FULLTEXT` indexes in MySQL[^mysql-fulltext].  We've done a lot of optimization to keep these searches efficient, and it _"just works"_.  However, MySQL isn't an optimal search engine for larger environments.

As you [scale](/docs/scaling), you may decide to switch to Elasticsearch or Sphinx. We support both.  These options require you to manage an additional service, but they're much faster and provide you with more control over how your content is indexed.

{% include setup_toc.html %}

# References

[^fts]: <https://en.wikipedia.org/wiki/Full-text_search>

[^mysql-fulltext]: <http://dev.mysql.com/doc/refman/5.7/en/fulltext-search.html>