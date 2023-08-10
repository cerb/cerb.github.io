---
title: global.search
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/global.search/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: global.search
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