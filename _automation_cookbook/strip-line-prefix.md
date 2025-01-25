---
title: Strip common prefixes from text lines
excerpt: Use the `|strip_lines` filter to remove prefixes from each line in a block
  of text.
summary: This page demonstrates how to use the strip_lines filter in automation scripting
  to remove common prefixes from text lines. It shows how to strip quoted email text
  and other prefixed content, making it useful for email processing and text manipulation
  tasks.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/strip-line-prefix.png
---

{% comment %}
* Log file prefix stripping
* Cleaning up formatted text
* Multi-character prefixes
* Whitespace handling
{% endcomment %}

## Removing email quotes

Here are examples of using the [\|strip_lines](/docs/scripting/filters#strip_lines) filter (prefix removal, quote stripping) for text processing in automation scripting.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    message@text:
      > This is quoted text
      > From a prior conversation
      > and we want to strip it out
      >
      This is the reply
  return:
    message: {{message|strip_lines(prefixes='>')}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  message: This is the reply
{% endraw %}
```
{% endtab %}

{% endtabs %}