---
title: "Scripting Reference"
excerpt: Bot actions can generate text using a full-featured templating language. Here's everything you need to know.
permalink: /docs/scripting/
redirect_from:
  - /docs/building-bots/scripting/
toc:
  title: Scripting
  expand: Developer Guide
jumbotron:
  title: Scripting
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/scripting/banner.png" class="screenshot">
</div>

Features like [automations](/docs/automations/) and [snippets](/docs/snippets/) often need to generate dynamic text.

For instance:
* Setting record fields
* Sending email messages
* Responding to chat messages
* Sending text messages
* Executing HTTP requests
* Generating notifications
* ...and so on

The content of this text may need to vary depending on any number of factors -- the current worker, record, automation inputs, day of week, etc.

In a traditional programming language, you typically generate text output like:

<pre>
<code class="language-python">
print("Hello, " + firstName + "!");
</code>
</pre>

This is cumbersome when you're dealing with a lot of text.

Instead, Cerb scripting is a full-featured templating language based on Twig[^twig]. A templating language makes the simple assumption that everything you type is text output until it encounters a special command.

The example code above would instead be written as:

<pre>
<code class="language-twig">
{% raw %}
Hello, {{first_name}}!
{% endraw %}
</code>
</pre>

# Topics

* [Variables](/docs/scripting/variables/)
* [Strings](/docs/scripting/strings/)
* [Arrays and Objects](/docs/scripting/arrays-objects/)
* [Dates](/docs/scripting/dates/)
* [Conditional Logic](/docs/scripting/conditional-logic/)
* [Operators](/docs/scripting/operators/)
* [Loops](/docs/scripting/loops/)
* [Regular Expressions](/docs/scripting/regular-expressions/)
* [JSON](/docs/scripting/json/)
* [XML](/docs/scripting/xml/)
* [Commands](/docs/scripting/commands/)
* [Functions](/docs/scripting/functions/)
* [Filters](/docs/scripting/filters/)
* [Tests](/docs/scripting/tests/)

# References

[^twig]: Twig: The flexible, fast, and secure template engine for PHP - <https://twig.symfony.com>