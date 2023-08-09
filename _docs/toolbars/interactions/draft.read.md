---
title: draft.read
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/draft.read/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: draft.read
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

The `draft.read` [toolbar](/docs/toolbars/) is displayed when reading a mail draft.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/draft-read.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `draft.read`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/example:
  uri: cerb:automation:example.draft.delete
  label: Delete
  icon: circle-remove
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `draft_*` | The [draft](/docs/records/types/draft/) record being viewed. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.draft.read`

### Inputs

The following `caller_params` are passed [interactions](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`selected_text`** | string | The currently selected editor text

### Output

(none)

### after:

| Key | Type |
|-|-|-
| **`refresh_widgets@list:`** | records | One or more [profile widget](/docs/records/types/profile_widget/) names to refresh
