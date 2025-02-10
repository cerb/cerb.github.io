---
title: automation.function
excerpt: This page provides an overview of the **automation.function** feature in
  Cerb, which allows for the creation of reusable shared functions that can be triggered
  by other automations.
summary: This page provides an overview of the **automation.function** feature in
  Cerb, which allows for the creation of reusable shared functions that can be triggered
  by other automations. It details the structure of inputs and outputs for these functions,
  explaining that the automation dictionary begins with custom input values from the
  caller. The page also describes how the function returns key/value pairs to the
  caller, with the possibility of nesting keys to return dictionaries.
permalink: /docs/automations/triggers/automation.function/
toc:
  title: automation.function
  expand: Automations
jumbotron:
  title: automation.function
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

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

{% highlight cerb %}
return:
  key1: value1
  key2: value2
  ...
{% endhighlight %}