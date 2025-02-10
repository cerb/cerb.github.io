---
title: 'Automations: repeat'
excerpt: This page provides a detailed explanation of the "repeat" command in Cerb
  automations, which is used to iterate over an array and execute a sequence of commands
  for each element.
summary: This page provides a detailed explanation of the "repeat" command in Cerb
  automations, which is used to iterate over an array and execute a sequence of commands
  for each element. It includes a practical example where numbers from 1 to 10 are
  summed, resulting in a total of 55. The page also outlines the syntax for using
  the "repeat" command, including the keys "each:", "as:", and "do:". The "each:"
  key specifies the array to iterate over, which can be formatted as CSV, JSON, or
  a newline-delimited list. The "as:" key names the placeholder for the current iteration's
  value, and the "do:" key contains the commands to be executed repeatedly.
permalink: /docs/automations/commands/repeat/
toc:
  title: repeat
  expand: Automations
jumbotron:
  title: repeat
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Commands &raquo;
    url: /docs/automations/#commands
---

The **repeat:** command iterates an array and repeats a sequence of commands for each value.

{% highlight cerb %}
{% raw %}
start:
  set:
    sum: 0
  repeat:
    each@json: [1,2,3,4,5,6,7,8,9,10]
    as: i
    do:
      set:
        sum@int: {{sum + i}}
  return:
    counter@key: counter
{% endraw %}
{% endhighlight %}

{% highlight cerb %}
counter: 55
{% endhighlight %}

* TOC
{:toc}

# Syntax

### each:

The `each:` key must resolve to an array.

This is most often accomplished with one of the following annotations:

|-
| `@csv` | Comma-separated values
| `@json` | JSON-encoded values
| `@list` | Newline-delimited values

### as:

The `as:` key names the placeholder that holds the value of the current iteration of `each:`.

This may optionally take the format of `key, value` to set a placeholder for both the key and value of `each:` item.

### do:

The `do:` key contains any number of [commands](/docs/automations/#commands) to repeat.