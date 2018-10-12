---
title: Bot Scripting
excerpt: Bot actions can generate text using a full-featured templating language. Here's everything you need to know.
permalink: /docs/bots/scripting/
redirect_from:
  - /docs/building-bots/scripting/
toc:
  title: Templates
jumbotron:
  title: Scripting
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
---

<div class="cerb-screenshot">
<img src="/assets/images/docs/bots/scripting/banner.png" class="screenshot">
</div>

The purpose of bot behaviors is to automatically perform actions in response to events.

Many of these actions need to generate text:
* Setting record fields
* Sending email messages
* Responding to chat messages
* Sending text messages
* Executing HTTP requests
* Generating notifications
* ...and so on

The content of this text may need to vary depending on any number of factors -- the event, record, behavior, time of day, day of week, etc.

To facilitate this, actions can generate text using a full-featured templating language based on Twig[^twig].

# Templates

In a traditional programming language, you typically generate output like:

<pre>
<code class="language-python">
print("Hello, " + firstName + "!")
</code>
</pre>

This is cumbersome when you're dealing with a lot of text.

In contrast, a templating language makes the simple assumption that everything you type is text to output until it encounters a special command.

A basic template might look like:

<pre>
<code class="language-twig">
{% raw %}
Hello, {{first_name}}!
{% endraw %}
</code>
</pre>

This is just scratching the surface. Templates can use placeholder [dictionaries](/docs/bots/behaviors/dictionaries/), filters, functions, conditional logic, and much more.

We'll cover those topics in the next sections.

### Links

[^twig]: Twig: The flexible, fast, and secure template engine for PHP - <https://twig.symfony.com>