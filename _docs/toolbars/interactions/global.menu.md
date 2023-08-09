---
title: global.menu
#excerpt: Toolbars...
#social_image_url: /assets/images/search/kata.png
permalink: /docs/toolbars/interactions/global.menu/
toc:
  title: Toolbars
  expand: Automations
jumbotron:
  title: global.menu
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

The global interactions [toolbar](/docs/toolbars/) is accessed from the floating Cerb icon in the lower right of every page.

<div class="cerb-screenshot">
<img src="/assets/images/docs/toolbars/global-menu.png" class="screenshot">
</div>

# Configuration

Navigate to **Search >> Toolbars**.

Edit the record for `global.menu`.

Add [interactions](/docs/automations/triggers/interaction.worker/) using [toolbar KATA](/docs/toolbars/#kata).

<pre>
<code class="language-cerb">
{% raw %}
interaction/hello:
  label: Hello
  uri: cerb:automation:example.hello
{% endraw %}
</code>
</pre>

The following **placeholders** are available in KATA:

|Key|
|-|-
| `worker_*` | The active [worker](/docs/records/types/worker/) record. Supports [key expansion](/docs/guide/developers/dictionaries/#key-expansion).

# Interactions

Caller: `cerb.toolbar.global.menu`

### Inputs

(none)

### Output

(none)