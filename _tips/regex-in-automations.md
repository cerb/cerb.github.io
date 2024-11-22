---
title: Regular expressions in automation scripting
excerpt: 'This page provides an example of using regular expressions within automation scripting to extract specific text patterns.'
summary: 'This page provides an example of using regular expressions within automation scripting to extract specific text patterns. It demonstrates how to define a text string and a regular expression pattern to identify and extract a ticket mask from the text. The example includes a conditional outcome that checks if the mask is found and returns a formatted output with the extracted ticket mask. This illustrates the practical application of regular expressions in automating text processing tasks.'
layout: integration
author: The Cerb Team
date: 2024-04-19 08:00:00 -0800
permalink: /tips/regex-in-automations/
jumbotron:
  title: "Regular expressions in automation scripting"
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Tips &raquo;
      url: /resources/tips/
---

Here's an example of using regular expressions to extract text within automation scripting.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    mask@text:
      {% set text = "The ticket mask that I am looking for is: KRN-69622-357 something else" %}
      {% set pattern %}/[A-Z]{3}-\d{5}-\d{3}/{% endset %}
      {{text|regexp(pattern)}}
  
  outcome/hasMask:
    if@bool: {{mask}}
    then:
      return:
        output: The ticket mask is #: {{mask}}
{% endraw %}
</code>
</pre>
