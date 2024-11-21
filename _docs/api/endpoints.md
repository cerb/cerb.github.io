---
title: 'API: Endpoints'
excerpt: This page provides a list of API endpoints available in Cerb, covering various
  functionalities such as Attachments, Automations, Bots, Contexts, Data, Groups,
  Packages, Parser, Records, Tickets, and Workers.
summary: This page provides a list of API endpoints available in Cerb, covering various
  functionalities such as Attachments, Automations, Bots, Contexts, Data, Groups,
  Packages, Parser, Records, Tickets, and Workers. These endpoints facilitate interaction
  with different components of the Cerb platform, enabling users to manage and automate
  tasks efficiently.
permalink: /docs/api/endpoints/
toc:
  title: Endpoints
jumbotron:
  title: Endpoints
  tagline: ""
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: API &raquo;
    url: /docs/api/
---

# Endpoints

{% for doc in site.docs %}{% assign path = doc.url|slice:0,20 %}{% if path == '/docs/api/endpoints/' and doc.id != page.id %}- [{{doc.title}}]({{doc.url}})
{% endif %}{% endfor %}
