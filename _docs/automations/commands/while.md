---
title: 'Automations: while'
excerpt: This page provides an overview of the "while" command in Cerb automations,
  which is used to conditionally repeat a sequence of actions, effectively creating
  controlled loops for various interactions and timers.
summary: This page provides an overview of the "while" command in Cerb automations,
  which is used to conditionally repeat a sequence of actions, effectively creating
  controlled loops for various interactions and timers. It includes a sample script
  demonstrating how to increment a counter until a condition is met. The page details
  the syntax for the "if" and "do" keys, explaining that "if@bool" must resolve to
  a boolean value to determine whether the loop continues, and "do" contains the commands
  to be repeated.
permalink: /docs/automations/commands/while/
toc:
  title: while
  expand: Automations
jumbotron:
  title: while
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **while:** command conditionally repeats a sequence of actions. This can implement controlled infinite loops for interactions and timers.

{% highlight cerb %}
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
{% endhighlight %}

{% highlight cerb %}
counter: 5
{% endhighlight %}

* TOC
{:toc}

# Syntax

### if:

The `if@bool:` key must resolve to a boolean value.

While `true`, the commands in `do:` are repeatedly executed.

If `false`, the while-loop terminates.

### do:

The `do:` key contains any number of [commands](/docs/automations/#commands) to repeat.