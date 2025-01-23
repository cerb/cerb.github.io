---
title: Receive arbitrary record types as input
excerpt: Accept an arbitrary record type and ID as input to create an expandable placeholder.
summary: This page demonstrates how to accept a record type and ID as input parameters in an automation, then use them to create an expandable record placeholder. This pattern is useful when you need to work with different types of records dynamically based on input parameters.
layout: integration
jumbotron:
  title: Receive arbitrary record types as input
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Accepts dynamic record type and ID inputs
* Creates expandable record placeholder
* Uses required input validation
* Works with any valid record type
* Builds on key expansion pattern
{% endcomment %}

You can accept any record type and ID as input parameters, then use them to create an expandable record placeholder.

## Input validation and placeholder creation

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  text/record_type:
    type: record_type
    required@bool: yes
  text/record_id:
    type: number
    required@bool: yes

start:
  set:
    record__context@key: inputs:record_type
    record_id@key: inputs:record_id
  
  return:
    output: {{record__label}}
{% endraw %}
</code>
</pre>
