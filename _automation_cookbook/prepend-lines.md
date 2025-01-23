---
title: Prepend a prefix to a text block
excerpt: Add a prefix to each line in a given block of text.
summary: "This page provides an example of how to add prefixes to each line of a given block of text in 
  Cerb, using the `set` and `return` blocks. It also describes variations for using the output 
  with workers, including copying it to the clipboard or pasting it into an existing message."
layout: integration
jumbotron:
  title: Prepend a prefix to a text block
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

In this example we quote a prior email message by adding the standard `>` character to the start of each line.

<pre>
<code class="language-cerb">
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
</code>
</pre>

The output gives us:

<pre>
<code class="language-cerb">
{% raw %}
__return:
  new_message: |-
    > This is quoted text
    > From a prior conversation
    > and we want to quote it

    ... and this is our reply.
{% endraw %}
</code>
</pre>

#### Variations:

In a worker interaction you can use ```return: clipboard:``` to immediately copy the output to the clipboard.

<pre>
<code class="language-cerb">
{% raw %}
return:
  clipboard: {{original_message|indent('> ')}}
{% endraw %}
</code>
</pre>

Or use ```return: snippet:``` to paste the output in an existing message at the cursor point.

<pre>
<code class="language-cerb">
{% raw %}
return:
  snippet: {{original_message|indent('> ')}}
{% endraw %}
</code>
</pre>