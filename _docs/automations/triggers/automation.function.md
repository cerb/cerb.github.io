---
title: "automation.function"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/automation.function/
toc:
  title: automation.function
  expand: Automations
jumbotron:
  title: automation.function
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

{% include docs/note_preview.html %}

**automation.function** [automations](/docs/automations/) are reusable shared functions triggered by other automations. 

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller

# Outputs

## return:

When the function concludes in the `return` state, it returns any number of key/value pairs to the caller. Keys may be nested to return dictionaries.

<pre>
<code class="language-cerb">
return:
  key1: value1
  key2: value2
  ...
</code>
</pre>