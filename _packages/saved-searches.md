---
title: Default Saved Searches
excerpt: A collection of preconfigured saved searches.
layout: integration
topic: Packages
permalink: /packages/saved-searches/
jumbotron:
  title: Default Saved Searches
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Packages &raquo;
    url: /resources/packages/
---

* TOC
{:toc}

# Introduction

This package imports a collection of preconfigured saved searches.

# Importing the package

Navigate to **Setup >> Configure >> Import Package**.

Paste the following package into the large text box:

<pre style="max-height: 29.25em;">
<code class="language-json">
{% raw %}
{
  "package": {
    "name": "Default Saved Searches",
    "cerb_version": "8.0.0",
    "revision": 1,
    "requires": {
      "cerb_version": "8.0.0",
      "plugins": [
      ]
    },
    "configure": {
      "prompts": [
      ],
      "placeholders": [
      ]
    }
  },
  "saved_searches": [
    {
      "uid": "saved_search_001",
      "name": "Available workers",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.worker",
      "tag": "available-workers",
      "query": "isAvailable:\"now to +15 mins\" isDisabled:n"
    },
    {
      "uid": "saved_search_002",
      "name": "My open tickets",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.ticket",
      "tag": "my-tickets",
      "query": "status:o owner.id:me"
    },
    {
      "uid": "saved_search_003",
      "name": "My open tasks",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.task",
      "tag": "my-tasks",
      "query": "status:o owner.id:me"
    },
    {
      "uid": "saved_search_004",
      "name": "Available tickets",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.ticket",
      "tag": "available-tickets",
      "query": "status:o owner.id:0"
    },
    {
      "uid": "saved_search_005",
      "name": "Available tasks",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.task",
      "tag": "available-tasks",
      "query": "status:o owner.id:0"
    },
    {
      "uid": "saved_search_006",
      "name": "My sent messages",
      "owner": {
        "context": "cerberusweb.contexts.app",
        "id": "0"
      },
      "context": "cerberusweb.contexts.message",
      "tag": "my-sent-messages",
      "query": "isOutgoing:y worker.id:me"
    }
  ]
}
{% endraw %}
</code>
</pre>

The following saves searches will be created for all workers:

<div class="cerb-screenshot">
<img src="/assets/images/packages/saved-searches/imported.png" class="screenshot">
</div>

# Using a saved search

Navigate to **Search >> Tickets**.

Open the quick search menu.  You should see a new **(saved searches)** section:

<div class="cerb-screenshot">
<img src="/assets/images/packages/saved-searches/quick-search-menu.png" class="screenshot">
</div>

Selecting a saved search will add that query to the quick search.

You can follow the same process on message, task, and worker worklists.