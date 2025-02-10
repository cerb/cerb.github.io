---
title: record.profile
excerpt: This page provides detailed instructions on configuring and customizing the
  profile toolbar for viewing a record's profile page in Cerb.
summary: This page provides detailed instructions on configuring and customizing the
  profile toolbar for viewing a record's profile page in Cerb. It guides users on
  navigating to the toolbar configuration section, editing the `record.profile` record,
  and adding interactions using the KATA scripting language. The page explains how
  to use placeholders like `record_*` and `worker_*` for dynamic content and outlines
  the inputs and outputs for interactions, specifically focusing on the `cerb.toolbar.record.profile`
  caller. It also describes how to refresh profile widgets after interactions.
permalink: /docs/toolbars/interactions/record.profile/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: record.profile
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The profile [toolbar](/docs/toolbars/) is displayed when viewing a record's profile page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/record-profile.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `record.profile`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

{% highlight cerb %}
{% raw %}
interaction/trackTime:
  uri: cerb:automation:example.trackTime
  tooltip: Track time
  icon: stopwatch
  hidden@bool:
    {{record__type is not pattern("task","ticket")}}
{% endraw %}
{% endhighlight %}

The following **placeholders** are available in KATA:

|Key|
|-|-
| `record_*` | The [record](/docs/records/types/) being viewed. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion). The `record__type` placeholder is the type (e.g. `ticket`).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.record.profile`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`record_`** | record | The [record](/docs/records/types/) dictionary

### Output

The caller expects no outputs.

### after:

| Key | Type |
|-|-|-
| **`refresh_widgets@list:`** | records | One or more [profile widgets](/docs/records/types/profile_widget/) names to refresh
