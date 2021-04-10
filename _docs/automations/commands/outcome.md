---
title: "Automations: outcome"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/outcome/
toc:
  title: outcome
  expand: Automations
jumbotron:
  title: outcome
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

The **outcome:** command makes a sequence of commands conditional. Each outcome must have a unique name.

| Key |
|-|-
| `if@bool:` | This key should resolve to a `yes` or `no` value to determine whether this outcome is desirable.
| `then:` | If this outcome matches, the [commands](/docs/automations/#commands) to run.

# Syntax

<pre>
<code class="language-cerb">
{% raw %}
start:
  outcome/weekend:
    if@bool: {{'now'|date('l') in ['Saturday','Sunday']}}
    then:
      return:
        output: It is the weekend.
{% endraw %}
</code>
</pre>

Multiple outcomes can be grouped in a [decision](/docs/automations/commands/decision/) command. The first matching outcome is used.