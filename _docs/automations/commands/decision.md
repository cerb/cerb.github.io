---
title: "Automations: decision"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/decision/
toc:
  title: decision
  expand: Automations
jumbotron:
  title: decision
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

The **decision:** command conditionally selects one of multiple potential outcomes.

# Syntax

<pre>
<code class="language-cerb">
{% raw %}
start:
  decision:
    outcome/weekend:
      if@bool: {{'now'|date('l') in ['Saturday','Sunday'] ? 'yes'}}
      then:
        return:
          output: It is the weekend.
    outcome/weekday:
      then:
        return:
          output: It is a weekday.
{% endraw %}
</code>
</pre>

## outcome:

A decision has multiple `outcome:` commands. The first matching outcome is used.

Each outcome must have a unique name.

| Key |
|-|-
| `if@bool:` | This key should resolve to a `yes` or `no` value to determine whether this outcome is desirable.
| `then:` | If this outcome matches, the [commands](/docs/automations/#commands) to run.

