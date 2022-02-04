---
title: "Data Queries: Platform Extensions"
excerpt: 
permalink: /docs/data-queries/platform/extensions/
social_image_url: /assets/images/docs/data-queries/data-queries.png
toc:
  title: Platform Extensions
jumbotron:
  title: Platform Extensions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Data Queries &raquo;
    url: /docs/data-queries/
---

# platform.extensions

`platform.extensions` data queries return a filterable and pageable list of plugin [extensions](/docs/record/types/) for a given `point`.

### Inputs
{: .no_toc}

|Req'd|Key|Notes
|:-:|-|-
|**√**| `point:` | An [extension point](/docs/record/types/)
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
type:platform.extensions
point:cerb.card.widget
format:dictionaries
{% endraw %}
</code>
</pre>

#### Response:

<pre style="max-height:29.5em;">
<code class="language-json">
{
  "data": [
    {
      "id": "cerb.card.widget.attachment.viewer",
      "name": "Attachment Viewer",
      "class": "CardWidget_AttachmentViewer",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.behavior.tree",
      "name": "Behavior Tree",
      "class": "CardWidget_BehaviorTree",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.classifier.trainer",
      "name": "Classifier Trainer",
      "class": "CardWidget_ClassifierTrainer",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.conversation",
      "name": "Conversation",
      "class": "CardWidget_Conversation",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.form_interaction",
      "name": "Interactions Toolbar",
      "class": "CardWidget_FormInteraction",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.kb_article.viewer",
      "name": "Knowledgebase Article",
      "class": "CardWidget_KbArticle",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.fields",
      "name": "Record Fields",
      "class": "CardWidget_Fields",
      "plugin_id": "cerberusweb.core",
      "params": []
    },
    {
      "id": "cerb.card.widget.sheet",
      "name": "Sheet",
      "class": "CardWidget_Sheet",
      "plugin_id": "cerberusweb.core",
      "params": []
    }
  ],
  "_": {
    "type": "platform.extensions",
    "format": "dictionaries"
  }
}
</code>
</pre>