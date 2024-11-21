---
title: mail.compose
excerpt: This page provides detailed instructions on configuring the compose toolbar
  in Cerb for sending new emails.
summary: This page provides detailed instructions on configuring the compose toolbar
  in Cerb for sending new emails. It guides users on how to navigate to the toolbar
  settings, edit the `mail.compose` record, and add interactions using the toolbar
  KATA. The page outlines the available placeholders, such as `worker_*`, for use
  in KATA, and describes the inputs and outputs for interactions, including how to
  handle selected text and insert snippets into the email editor.
permalink: /docs/toolbars/interactions/mail.compose/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: mail.compose
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The compose [toolbar](/docs/toolbars/) is displayed when sending a new email.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/mail-compose.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `mail.compose`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/example:
  uri: cerb:automation:example.alert
  label: Example
  icon: bell
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.mail.compose`

### Inputs

The following `caller_params` are passed [interactions](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`selected_text`** | string | The currently selected editor text

### Output

[Interactions](/docs/automations/triggers/interaction.worker/) can `return:` the following keys:

| Key | Type |
|-|-|-
| **`snippet`** | string | A snippet of text to insert in the editor at the cursor
