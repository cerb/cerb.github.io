---
title: "Data Queries: Record Types"
excerpt: 
permalink: /docs/data-queries/record/types/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Record Types
jumbotron:
  title: Record Types
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

{% include docs/note_preview.html %}

# record.types

`record.types` data queries return a filterable and pageable list of [record types](/docs/record/types/).

### Inputs
{: .no_toc}

|Req'd|Key|Notes
|:-:|-|-
| | `filter:` | An optional keyword used to filter the results
| | `limit:` | The desired number of results per page
| | `page:` | The desired starting page (zero-based)

### Response Formats
{: .no_toc}

* **dictionaries** (default) returns a table-based format suitable for [sheets](/docs/sheets/) and API results.

### Examples
{: .no_toc}

#### Query: 

<pre>
<code class="language-cerb">
{% raw %}
type:record.types
filter:widget
format:dictionaries
{% endraw %}
</code>
</pre>

#### Response:

<pre style="max-height:29.5em;">
<code class="language-json">
{
  "data": {
    "18": {
      "id": "cerb.contexts.card.widget",
      "uri": "card_widget",
      "label_singular": "Card Widget",
      "label_plural": "Card Widgets"
    },
    "69": {
      "id": "cerb.contexts.portal.widget",
      "uri": "portal_widget",
      "label_singular": "Portal Widget",
      "label_plural": "Portal Widgets"
    },
    "71": {
      "id": "cerberusweb.contexts.profile.widget",
      "uri": "profile_widget",
      "label_singular": "Profile Widget",
      "label_plural": "Profile Widgets"
    },
    "98": {
      "id": "cerberusweb.contexts.workspace.widget",
      "uri": "workspace_widget",
      "label_singular": "Workspace Widget",
      "label_plural": "Workspace Widgets"
    }
  },
  "_": {
    "type": "record.types",
    "format": "dictionaries"
  }
}
</code>
</pre>