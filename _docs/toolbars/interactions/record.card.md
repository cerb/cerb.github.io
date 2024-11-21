---
title: record.card
excerpt: This page provides detailed instructions on configuring and customizing the
  card toolbar in Cerb when viewing a record's card popup.
summary: This page provides detailed instructions on configuring and customizing the
  card toolbar in Cerb when viewing a record's card popup. It guides users through
  navigating to the toolbar settings, editing the `record.card` configuration, and
  adding interactions using the KATA scripting language. The page explains the use
  of placeholders for accessing record and worker information and outlines the expected
  inputs and outputs for interactions, including parameters and return values. Additionally,
  it describes how to refresh card widgets after interactions. This information is
  essential for users looking to enhance their workflow by customizing the card toolbar
  in Cerb.
permalink: /docs/toolbars/interactions/record.card/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: record.card
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The card [toolbar](/docs/toolbars/) is displayed when viewing a record's card popup.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/record-card.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `record.card`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/trackTime:
  uri: cerb:automation:example.trackTime
  tooltip: Track time
  icon: stopwatch
  hidden@bool:
    {{record__type is not pattern("task","ticket")}}
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `record_*` | The [record](/docs/records/types/) being viewed. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion). The `record__type` placeholder is the type (e.g. `ticket`).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.record.card`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`record_`** | record | The [record](/docs/records/types/) dictionary

### Output

The caller expects the following `return:` dictionary:

| Key | Type |
|-|-|-
| **`close@bool:`** | boolean | `yes` to close the card popup

### after:

| Key | Type |
|-|-|-
| **`refresh_widgets@list:`** | records | One or more [card widgets](/docs/records/types/card_widget/) names to refresh
