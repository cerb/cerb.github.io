---
title: mail.read
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/mail.read/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: mail.read
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

The message [toolbar](/docs/toolbars/) is displayed when viewing email messages on a ticket profile page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/mail-read.png" class="screenshot">
</div>

### Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `mail.read`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/feedback:
  label: Capture Feedback
  icon: conversation
  uri: cerb:automation:example.captureFeedback
  #after:
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `message_*` | The [message](/docs/records/types/message/) record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/).
| `widget_*` | The widget record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/). `widget__type` will be one of: [card_widget](/docs/records/types/card_widget/), [profile_widget](/docs/records/types/profile_widget/), or [workspace_widget](/docs/records/types/workspace_widget/).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/).

# Interactions

Caller: `cerb.toolbar.mail.read`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`message_id`** | record | The [message](/docs/records/types/message/) record
| **`selected_text`** | string | The currently selected text

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`reply:draft_id:`** | record | The [draft](/docs/records/types/draft/) ID to resume

### after:

| Key | Type |
|-|-|-
| **`refresh_widgets@list:`** | records | One or more [profile widget](/docs/records/types/profile_widget/) names to refresh
