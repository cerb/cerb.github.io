---
title: scripting.function
excerpt: This page provides an overview of the "scripting.function" feature in Cerb,
  which allows automations to be triggered using the cerb_automation() function from
  various parts of the platform, such as automations, behaviors, snippets, events,
  and toolbars.
summary: This page provides an overview of the "scripting.function" feature in Cerb,
  which allows automations to be triggered using the cerb_automation() function from
  various parts of the platform, such as automations, behaviors, snippets, events,
  and toolbars. It details the structure of the automation dictionary, which includes
  custom input values from the caller, and explains how the function can return multiple
  key/value pairs, including nested dictionaries, to the caller upon completion.
permalink: /docs/automations/triggers/scripting.function/
toc:
  title: scripting.function
  expand: Automations
jumbotron:
  title: scripting.function
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**scripting.function** [automations](/docs/automations/) are invoked with the [cerb_automation()](/docs/scripting/functions/#cerb_automation) function from [scripting](/docs/scripting/) anywhere in Cerb (e.g. automations, behaviors, snippets, events, toolbars).

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