---
title: global.search
excerpt: This page provides information on configuring and using the global search
  toolbar in Cerb.
summary: "This page provides information on configuring and using the global search
  toolbar in Cerb. It explains how to access the toolbar from the search icon on every
  page and details the configuration process through the \"Search \xBB Toolbars\"
  menu. The page includes instructions for editing the global search record and adding
  interactions using toolbar KATA, with an example of a ticket search interaction.
  It also lists available placeholders in KATA, such as `worker_*` for the active
  worker record. The page outlines the caller and input/output specifications for
  interactions related to the global search toolbar."
permalink: /docs/toolbars/interactions/global.search/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: global.search
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Toolbars &raquo;
    url: /docs/toolbars/
---

The global search [toolbar](/docs/toolbars/) is accessed from the search icon in the top right of every page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/global-search.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `global.search`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/ticketSearch:
  uri: cerb:automation:wgm.example.ticketSearchInteraction
  label: Ticket search
  icon: search
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.global.search`

### Inputs

(none)

### Output

(none)