---
title: "Automations: function"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/function/
toc:
  title: function
  expand: Automations
jumbotron:
  title: function
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

The **function:** command executes an [automation.function](/docs/automations/triggers/automation.function/) and returns an output dictionary.

With this automation function named `example.math.sum`:

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  array/numbers:
    required@bool: yes

start:
  return:
    sum@text,int:
      {{array_sum(inputs.numbers)}}
{% endraw %}
</code>
</pre>

This automation uses the function:

<pre>
<code class="language-cerb">
{% raw %}
start:
  function/sum:
    uri: cerb:automation:example.math.sum
    output: result
    inputs:
      numbers@csv: 2,4,8
    on_success:
      return:
        sum@key: result:sum
{% endraw %}
</code>
</pre>

To return:

<pre>
<code class="language-cerb">
  sum: 14
</code>
</pre>

* TOC
{:toc}

# Syntax

## uri:

The [automation.function](/docs/automations/triggers/automation.function/) to run.

## inputs:

The inputs vary based on the automation function.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of the function.

If omitted, the function is executed during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives the return dictionary from the function. 

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.
