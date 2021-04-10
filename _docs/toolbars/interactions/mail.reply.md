---
title: mail.reply
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/mail.reply/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: mail.reply
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
| `message_*` | The [message](/docs/records/types/message/) record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/bots/behaviors/dictionaries/key-expansion/).

# Interactions

Caller: `cerb.toolbar.mail.reply`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`selected_text`** | string | The currently selected editor text

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`snippet`** | string | A snippet of text to insert in the editor at the cursor
