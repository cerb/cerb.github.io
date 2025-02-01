---
title: Receive arbitrary record types as input
excerpt: Accept an arbitrary record type and ID as input to create an expandable placeholder.
summary: This page demonstrates how to accept a record type and ID as input parameters
  in an automation, then use them to create an expandable record placeholder. This
  pattern is useful when you need to work with different types of records dynamically
  based on input parameters.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/input-record-placeholder.png
redirect_from:
- /automation/cookbook/input-record-placeholder/
---

{% comment %}
* Accepts dynamic record type and ID inputs
* Creates expandable record placeholder
* Uses required input validation
* Works with any valid record type
* Builds on key expansion pattern
{% endcomment %}

## Dynamic record type and ID as input

You can accept any record type and ID as input parameters, then use them to create an expandable record placeholder.

{% tabs input_record_placeholder %}

{% tab input_record_placeholder automation %}
```cerb
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
```
{% endtab %}

{% endtabs %}
