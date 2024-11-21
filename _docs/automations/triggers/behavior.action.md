---
title: behavior.action
excerpt: This page provides information on the **behavior.action** automations in
  Cerb, which are executed from legacy bot behaviors.
summary: This page provides information on the **behavior.action** automations in
  Cerb, which are executed from legacy bot behaviors. It explains the use of event
  handler KATA to trigger the first enabled automation. The page details the structure
  of inputs and outputs for these automations, including how the automation dictionary
  is initialized with custom input values and how the function returns key/value pairs
  to the caller, with the possibility of nested keys for returning dictionaries.
permalink: /docs/automations/triggers/behavior.action/
toc:
  title: behavior.action
  expand: Automations
jumbotron:
  title: behavior.action
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**behavior.action** [automations](/docs/automations/) are executed from legacy bot behaviors.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

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