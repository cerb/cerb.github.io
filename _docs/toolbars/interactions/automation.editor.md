---
title: automation.editor
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/automation.editor/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: automation.editor
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

{% comment %}
Properly document these options
{% endcomment}

{% include docs/note_preview.html %}

The [toolbar](/docs/toolbars/) displayed in the automation editor.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/automation-editor.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `automation.editor`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/magic:
  uri: cerb:automation:wgm.example.openai
  icon: magic
  tooltip: Add form elements with OpenAI
  hidden@bool:
    {{trigger_name not in [
      'interaction.website',
      'interaction.worker',
    ]}}
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `trigger_id` | The extension ID of the current automation trigger.
| `trigger_name` | The name of the current automation trigger.
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/).

# Interactions

{% comment %}
Caller: `cerb.toolbar.automation.editor`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`selected_text`** | string | The currently selected editor text
{% endcomment %}

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`snippet`** | string | A snippet of text to insert in the editor at the cursor