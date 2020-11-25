---
title: "Data Queries: UI Icons"
excerpt: 
permalink: /docs/data-queries/ui/icons/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: UI Icons
jumbotron:
  title: UI Icons
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# ui.icons

`ui.icons` data queries return a filterable and pageable list of icons.

### Inputs
{: .no_toc}

|Req'd|Key|Notes
|:-:|-|-
| | `filter:` | An optional keyword used to filter the results.
| | `limit:` | The desired number of results per page.
| | `page:` | The desired starting page (zero-based).

### Response Formats
{: .no_toc}

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

### Examples
{: .no_toc}

#### Query: 

<pre>
<code class="language-cerb">
{% raw %}
type:ui.icons
filter:git
limit:10
format:dictionaries
{% endraw %}
</code>
</pre>

#### Response:

<pre>
<code class="language-json">
{
  "data": [
    {
      "icon": "git-branch"
    },
    {
      "icon": "git-commit"
    },
    {
      "icon": "git-compare"
    },
    {
      "icon": "git-create"
    },
    {
      "icon": "git-delete"
    },
    {
      "icon": "git-merge"
    },
    {
      "icon": "git-private"
    },
    {
      "icon": "git-pull-request"
    }
  ],
  "_": {
    "type": "ui.icons",
    "format": "dictionaries",
    "paging": {
      "page": {
        "of": 1,
        "rows": {
          "of": 8,
          "count": 8,
          "limit": 10,
          "from": 1,
          "to": 8
        },
        "index": 0
      }
    }
  }
}
</code>
</pre>