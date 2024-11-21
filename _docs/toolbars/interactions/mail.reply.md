---
title: mail.reply
excerpt: This page provides detailed instructions on configuring and using the reply
  toolbar in Cerb when sending an email reply.
summary: This page provides detailed instructions on configuring and using the reply
  toolbar in Cerb when sending an email reply. It guides users on how to navigate
  to the toolbar settings, specifically for `mail.reply`, and how to add interactions
  using the toolbar KATA. The page outlines the available placeholders for KATA, such
  as `message_*` and `worker_*`, which support key expansion. It also describes the
  interactions, including the caller parameters like `selected_text` and `text`, and
  the expected output, which is a text snippet to be inserted in the editor.
permalink: /docs/toolbars/interactions/mail.reply/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: mail.reply
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The reply [toolbar](/docs/toolbars/) is displayed when sending a reply to an email.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/mail-reply.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `mail.reply`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/autoreply:
  label: Auto-Reply
  uri: cerb:automation:example.autoreply
  icon: magic
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `message_*` | The [message](/docs/records/types/message/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.mail.reply`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`selected_text`** | string | The currently selected editor text, if any
| **`text`** | string | The full editor text

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`snippet`** | string | A snippet of text to insert in the editor at the cursor
