---
layout: post
title: "Tip: Initials in signatures"
excerpt: Display initials for a worker's first or last name in their signature.
author: The Cerb Team
date: 2018-03-06 17:30:00 -0700
permalink: /tips/signature-initials/
tags: cerb tips mailbag
---

A client asked:

> How can I just use the initial of a worker's last name in their signature?

Our templating language is based on [Twig](https://twig.symfony.com/doc/2.x/filters/slice.html), which includes a handy syntax for extracting substrings from text:

{%raw%}`{{"this is a string"[start:length]}}`{%endraw%}

* `start` specifies the character to start from, with the first position being 0.
* `length` specifies how many characters to extract.

So you could display the first initial of a worker's last name using:

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = "Kina" %}
{% set last_name = "Halpue" %}
{{first_name}} {{last_name[0:1]}}
{% endraw %}
</code>
</pre>

Which would output:

~~~
Kina H
~~~

You can also do things like:

<pre>
<code class="language-twig">
{% raw %}
{% set first_name = "Kina" %}
{% set last_name = "Halpue" %}

{# Shortcut for the first letter #}
{{last_name[:1]}}

{# Everything except for the first letter #}
{{last_name[1:]}}

{# The last three letters #}
{{last_name[-3:]}}
{% endraw %}
</code>
</pre>

Which outputs:

~~~
H

alpue

pue
~~~
