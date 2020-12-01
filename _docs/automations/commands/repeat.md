---
title: "Automations: repeat"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/repeat/
toc:
  title: repeat
  expand: Automations
jumbotron:
  title: repeat
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

The **repeat:** command iterates an array and repeats a sequence of commands for each value.

<pre>
<code class="language-cerb">
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
</code>
</pre>

<pre>
<code class="language-cerb">
counter: 55
</code>
</pre>

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

### do:

The `do:` key contains any number of [commands](/docs/automations/#commands) to repeat.