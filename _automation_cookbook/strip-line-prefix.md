---
title: Strip common prefixes from text lines
excerpt: Use the `|strip_lines` filter to remove prefixes from each line in a block of text.
summary: This page demonstrates how to use the strip_lines filter in automation scripting to remove common prefixes from text lines. It shows how to strip quoted email text and other prefixed content, making it useful for email processing and text manipulation tasks.
layout: integration
jumbotron:
  title: Strip common prefixes from text lines
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Log file prefix stripping
* Cleaning up formatted text
* Multi-character prefixes
* Whitespace handling
{% endcomment %}

Here are examples of using the `|strip_lines` filter (prefix removal, quote stripping) for text processing in automation scripting.

## Removing email quotes

<pre>
<code class="language-cerb">
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
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  message: This is the reply
{% endraw %}
</code>
</pre>
