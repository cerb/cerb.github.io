---
title: records.worklist
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/records.worklist/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: records.worklist
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

The `records.worklist` [toolbar](/docs/toolbars/) is displayed below [worklists](/docs/worklists/).

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/records-worklist.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `records.worklist`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/customExplore:
  label: custom explore
  icon: play-button
  uri: cerb:automation:cerb.worklist.buttons.explore
  inputs:
    open_new_tab: yes
  class: action-always-show
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `worklist_record_type` | The record type of the worklist (e.g. ticket).
| `worklist_id` | The id of the worklist (e.g. cust_1234).
| `worklist_query` | The query of the worklist (e.g. status:o group:Support).
| `worklist_query_required` | The required query of the worklist (e.g. status:o group:Support).
| `worklist_page` | The current page of the worklist (e.g. 2).
| `worklist_limit` | The number of records per worklist page (e.g. 25).
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.records.worklist`

### Inputs

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type |
|-|-|-
| **`worklist_id`** | string | The ID of the displayed [worklist](/docs/worklists/).
| **`worklist_record_type`** | string | The [record type](/docs/records/types/) of the displayed [worklist](/docs/worklists/).
| **`selected_record_ids`** | array | An array of selected record IDs in the worklist (if any).

### Output

The caller expects no outputs.

### after:

| Key | Type |
|-|-|-
| **`refresh_worklist@bool:`** | boolean | Refresh the [worklist](/docs/worklists/) after the interaction ends
