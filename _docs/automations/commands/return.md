---
title: 'Automations: return'
excerpt: This page provides information on the "return" command in Cerb automations,
  which is used to successfully terminate an automation in the `return` state and
  return a dictionary.
summary: This page provides information on the "return" command in Cerb automations,
  which is used to successfully terminate an automation in the `return` state and
  return a dictionary. It includes syntax examples, demonstrating how to use the command
  to output a message with dynamic content. The specific structure of the `return:`
  dictionary is determined by the automation trigger.
permalink: /docs/automations/commands/return/
toc:
  title: return
  expand: Automations
jumbotron:
  title: return
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **return:** command successfully terminates an [automation](/docs/automations/) in the `return` [state](/docs/automations/#exit-states) and returns a [dictionary](/docs/automations/#dictionaries).

# Syntax

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    name: Kina
  return:
    output@text:
      Hello, {{name}}!
{% endraw %}
</code>
</pre>

The expected `return:` dictionary depends on the automation [trigger](/docs/automations/#triggers).
