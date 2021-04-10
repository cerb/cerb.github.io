---
title: "Automations: while"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/while/
toc:
  title: while
  expand: Automations
jumbotron:
  title: while
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

The **while:** command conditionally repeats a sequence of actions. This can implement controlled infinite loops for interactions and timers.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    counter: 0
  while:
    if@bool: {{counter < 5 ? 'yes'}}
    do:
      set:
        counter: {{counter+1}}
  return:
    counter@key: counter
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
counter: 5
</code>
</pre>

* TOC
{:toc}

# Syntax

### if:

The `if@bool:` key must resolve to a boolean value.

While `true`, the commands in `do:` are repeatedly executed.

If `false`, the while-loop terminates.

### do:

The `do:` key contains any number of [commands](/docs/automations/#commands) to repeat.