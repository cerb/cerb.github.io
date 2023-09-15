---
title: comment.editor
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/comment.editor/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: comment.editor
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Toolbars &raquo;
    url: /docs/toolbars/
---

The [toolbar](/docs/toolbars/) displayed in the comment editor.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/comment-editor.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `comment.editor`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/snippets:
  uri: cerb:automation:wgm.example.snippet
  icon: paste
  tooltip: Paste snippets
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `record_*` | The [dictionary](/docs/guide/developers/dictionaries/) of the [record](/docs/records/) being commented upon.
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.comment.editor`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`record_id`** | number | The record ID being commented upon
| **`record_type`** | string | The record type being commented upon
| **`selected_text`** | string | The currently selected editor text
| **`text`** | string | The full editor text

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`snippet`** | string | A snippet of text to insert in the editor at the cursor