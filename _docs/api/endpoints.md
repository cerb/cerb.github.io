---
title: "API: Endpoints"
permalink: /docs/api/endpoints/
toc:
  title: Endpoints
jumbotron:
  title: Endpoints
  tagline: ""
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: API &raquo;
    url: /docs/api/
---

# Endpoints

{% for doc in site.docs %}{% assign path = doc.url|slice:0,20 %}{% if path == '/docs/api/endpoints/' and doc.id != page.id %}- [{{doc.title}}]({{doc.url}})
{% endif %}{% endfor %}


{% comment %}
### (Deprecated Endpoints)

{% for doc in site.docs %}{% assign path = doc.url|slice:0,21 %}{% if path == '/docs/api/deprecated/' %}- [{{doc.title}}]({{doc.url}})
{% endif %}{% endfor %}
{% endcomment %}
