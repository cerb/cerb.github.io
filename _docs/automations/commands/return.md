---
title: "Automations: return"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/return/
toc:
  title: return
  expand: Automations
jumbotron:
  title: return
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
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
