---
title: "API: Records"
permalink: /docs/api/records/
toc:
  title: Modifying Records
jumbotron:
  title: Modifying Records
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
---

You can programmatically create, retrieve, update, upsert, search, and delete every [record type](/docs/records/types/) in Cerb using the [Records API Endpoints](/docs/api/endpoints/records/).

# Examples

{% for doc in site.docs %}{% assign path = doc.url|slice:0,18 %}{% if path == '/docs/api/records/' and doc.id != page.id %}- [{{doc.title}}]({{doc.url}})
{% endif %}{% endfor %}