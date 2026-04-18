---
title: 'Data Queries: Record Filters'
excerpt: This page provides detailed information on `record.filters` data queries in
  Cerb, which are used to retrieve the available search filters for a given record type.
summary: This page provides detailed information on `record.filters` data queries in
  Cerb, which are used to retrieve the available search filters for a given record type.
  It outlines the required and optional inputs, such as the record type and whether
  to exclude link filters. The response format is primarily in dictionaries. The page
  includes an example query for ticket records and a response detailing filter keys,
  types, and usage examples. This is useful for dynamic filter discovery, LLM search
  agents, and autocomplete.
permalink: /docs/data-queries/record/filters/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Record Filters
jumbotron:
  title: Record Filters
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Data Queries &raquo;
    url: /docs/data-queries/
---

# record.filters

`record.filters` data queries return the available search filters for a given [record type](/docs/records/types/). This is useful for dynamic filter discovery, powering [LLM search agents](/docs/automations/commands/llm.agent/), and building autocomplete interfaces.

### Inputs
{: .no_toc}

| Req'd | Key | Notes
|:-----:|-|-
| **x** | `of:` | The [record type](/docs/records/types/) alias (e.g. `ticket`)
|       | `exclude_links:` | `yes` to omit virtual link filters (default `no`)

### Response Formats
{: .no_toc}

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

### Examples
{: .no_toc}

#### Query:

{% highlight cerb %}
{% raw %}
type:record.filters
of:ticket
exclude_links:yes
format:dictionaries
{% endraw %}
{% endhighlight %}

#### Response:

{% highlight json %}
{
  "data": {
    "id": {
      "type": "number",
      "options": { "param_key": "t_id" },
      "examples": [
        { "type": "chooser", "context": "cerberusweb.contexts.ticket", "q": "" }
      ],
      "is_sortable": true
    },
    "mask": {
      "type": "text",
      "options": { "param_key": "t_mask", "match": 1 },
      "is_sortable": true
    },
    "subject": {
      "type": "text",
      "options": { "param_key": "t_subject", "match": 1 },
      "is_sortable": true
    },
    "status": {
      "type": "virtual",
      "options": { "param_key": "t_status_id" },
      "examples": ["open", "waiting", "closed", "deleted", "[o,w]", "![d]"],
      "is_sortable": true
    },
    "owner": {
      "type": "virtual",
      "options": { "param_key": "*_owner_search" },
      "examples": [
        { "type": "search", "context": "cerberusweb.contexts.worker", "q": "" }
      ],
      "is_sortable": false
    },
    "group.id": {
      "type": "chooser",
      "options": { "param_key": "t_team_id" },
      "examples": [
        { "type": "chooser", "context": "cerberusweb.contexts.group", "q": "" }
      ],
      "is_sortable": true
    },
    "bucket.id": {
      "type": "chooser",
      "options": { "param_key": "t_bucket_id" },
      "examples": [
        { "type": "chooser", "context": "cerberusweb.contexts.bucket", "q": "" }
      ],
      "is_sortable": true
    }
  },
  "_": {
    "type": "record.filters",
    "format": "dictionaries"
  }
}
{% endhighlight %}

Each key in `data` is a filter name usable in [search queries](/docs/search/). Each entry includes:

| Field | Description
|-|-
| `type` | The filter type (e.g. `fulltext`, `date`, `number`, `text`, `virtual`, `worker`)
| `options` | Internal options including `param_key` (the underlying query parameter)
| `examples` | Optional sample values; strings for literal input, or objects with `type: "chooser"` or `type: "search"` for record pickers
| `is_sortable` | Whether this filter's field can be used for sorting results
