---
title: Regular expressions in automation scripting
excerpt: Use regular expressions to extract text from automation scripting.
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
