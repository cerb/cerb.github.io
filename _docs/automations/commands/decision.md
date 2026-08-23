---
title: 'Automations: decision'
excerpt: This page provides an overview of the "decision" command in Cerb automations,
  which is used to conditionally select one of multiple potential outcomes based on
  specified conditions.
summary: This page provides an overview of the "decision" command in Cerb automations,
  which is used to conditionally select one of multiple potential outcomes based on
  specified conditions. It explains the syntax and structure of the decision command,
  highlighting the use of multiple "outcome" commands, each with a unique name. The
  page details how each outcome is evaluated using the `if@bool:` key to determine
  if it is desirable, and the `then:` key to specify the commands to execute if the
  outcome matches. An example is provided to illustrate how the decision command can
  differentiate between weekdays and weekends.
permalink: /docs/automations/commands/decision/
toc:
  title: decision
  expand: Automations
jumbotron:
  title: decision
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **decision:** command conditionally selects one of multiple potential outcomes.

# Syntax

{% highlight cerb %}
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
{% endhighlight %}

## outcome:

A decision has multiple `outcome:` commands. The first matching outcome is used.

Each outcome must have a unique name.

An outcome with no `if:` key always matches, so a bare outcome at the end of a decision is the default -- `outcome/weekday:` above. If no outcome matches and there's no default, none of the `then:` blocks run, execution continues with the next command, and nothing is logged.

An [outcome:](/docs/automations/commands/outcome/) can also be used on its own, without a decision, to make a single sequence of commands conditional.

| Key |
|-|-
| `if@bool:` | This key should resolve to a `yes` or `no` value to determine whether this outcome is desirable.
| `then:` | If this outcome matches, the [commands](/docs/automations/#commands) to run.

