---
title: Prepend a prefix to a text block
excerpt: Add a prefix to each line in a given block of text.
summary: This page provides an example of how to add prefixes to each line of a given
  block of text in Cerb, using the `set` and `return` blocks. It also describes variations
  for using the output with workers, including copying it to the clipboard or pasting
  it into an existing message.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/prepend-lines.png
redirect_from:
- /automation/cookbook/prepend-lines/
---

## Using |indent

In this example we quote a prior email message by adding the standard `>` character to the start of each line.

{% tabs prepend_lines %}

{% tab prepend_lines automation %}
```cerb
{% raw %}
start:
  set:
    original_message@text:
      This is quoted text
      From a prior conversation
      and we want to quote it
  return:
    new_message@text:
      {{original_message|indent('> ')}}
      
      ... and this is our reply.
{% endraw %}
```
{% endtab %}

{% tab prepend_lines output %}
```cerb
{% raw %}
__return:
  new_message: |-
    > This is quoted text
    > From a prior conversation
    > and we want to quote it

    ... and this is our reply.
{% endraw %}
```
{% endtab %}

{% endtabs %}
