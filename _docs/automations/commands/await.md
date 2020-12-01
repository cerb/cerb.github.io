---
title: "Automations: await"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/await/
toc:
  title: await
  expand: Automations
jumbotron:
  title: await
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

{% include docs/note_preview.html %}

The **await:** command pauses an [automation](/docs/automations/) in the `await` [state](/docs/automations/#exit-states) and returns a [dictionary](/docs/automations/#dictionaries).

This creates a [continuation](/docs/automations/#continuations) for resuming the automation at the current point.

# Syntax

<pre>
<code class="language-cerb">
{% raw %}
start:
  await:
    form:
      title: Intro
      elements:
        text/prompt_name:
          label: What is your name?
          required@bool: yes
  return:
    output@text:
      Hello, {{prompt_name}}!
{% endraw %}
</code>
</pre>

The expected dictionary depends on the trigger.

These [triggers](/docs/automations/#triggers) support the `await` state:

| Trigger 
|-
| [ui.interaction](/docs/automations/triggers/ui.interaction/#await) | The dictionary describes a form for gathering user input.

