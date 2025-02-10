---
title: comment.editor
excerpt: This page provides detailed instructions for configuring and utilizing the
  comment editor toolbar in Cerb.
summary: This page provides detailed instructions for configuring and utilizing the
  comment editor toolbar in Cerb. It explains how to navigate to the toolbar settings,
  edit the `comment.editor` record, and add interactions using the KATA scripting
  language. The page outlines available placeholders for use in KATA, such as `record_*`
  and `worker_*`, which provide context about the record being commented on and the
  active worker. It also describes the inputs and outputs for interactions with the
  toolbar, detailing the parameters passed to the interaction and the expected return
  values, such as inserting text snippets into the editor.
permalink: /docs/toolbars/interactions/comment.editor/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: comment.editor
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
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

{% highlight cerb %}
{% raw %}
interaction/snippets:
  uri: cerb:automation:wgm.example.snippet
  icon: paste
  tooltip: Paste snippets
{% endraw %}
{% endhighlight %}

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