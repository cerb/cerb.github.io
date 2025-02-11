---
title: 'Automations: error'
excerpt: This page provides information on the **error:** command used in Cerb automations.
summary: This page provides information on the **error:** command used in Cerb automations.
  It explains that this command is used to terminate an automation unsuccessfully
  by setting it to an `error` state and returning a specified error message to the
  caller. The page includes a syntax example demonstrating how to implement the command
  within an automation script.
permalink: /docs/automations/commands/error/
toc:
  title: error
  expand: Automations
jumbotron:
  title: error
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **error:** command unsuccessfully terminates an [automation](/docs/automations/) in the `error` [state](/docs/automations/#exit-states) and returns a message.

# Syntax

{% highlight cerb %}
{% raw %}
start:
  error: An unexpected error occurred!
{% endraw %}
{% endhighlight %}

The error message is returned to the caller.

{% comment %}
* dictionary return
* `__error` vs `__return`
* `_message` in return
* `__error:at:` and `message:`
{% endcomment %}