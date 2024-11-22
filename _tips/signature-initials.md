---
title: 'Initials in signatures'
excerpt: Display initials for a worker's first or last name in their signature.
summary: This page provides guidance on using the Twig templating language to manipulate
  text in signatures, specifically focusing on extracting initials from a worker's
  last name. It explains how to use substring syntax to display the first initial
  of a last name and offers examples of other text manipulations, such as extracting
  the first letter, everything except the first letter, and the last three letters
  of a string.
layout: integration
author: The Cerb Team
date: "2018-03-06 17:30:00 -0700"
permalink: /tips/signature-initials/
jumbotron:
  title: 'Initials in signatures'
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Packages &raquo;
      url: /resources/packages/
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
