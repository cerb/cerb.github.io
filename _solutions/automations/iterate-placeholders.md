---
title: Iterate through unknown placeholders
excerpt: Use `cerb_placeholders_list()` to iterate through placeholders with unknown
  keys.
summary: This page demonstrates how to use the `cerb_placeholders_list()` function
  to iterate through placeholders when their keys are not known in advance. It shows
  how to filter placeholders by prefix and access their values dynamically, making
  it useful for working with dynamically generated placeholder names.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/iterate-placeholders.png
redirect_from:
- /automation/cookbook/iterate-placeholders/
---

{% comment %}
* Uses cerb_placeholders_list() function
* Filters placeholders by prefix
* Handles dynamic key names
* Demonstrates iteration patterns
* Shows prefix-based filtering
{% endcomment %}

## Creating and iterating random placeholders

Here is an example of using the [cerb_placeholders_list()](/docs/scripting/functions/#cerb_placeholders_list) function to iterate through placeholders with unknown keys. The optional first argument is a prefix filter. 

{% tabs iterate_placeholders %}

{% tab iterate_placeholders automation %}
```cerb
{% raw %}
start:
  repeat:
    each@csv: {{range(1, 10)|join(',')}}
    as: i
    do:
      var.set:
        inputs:
          key: random_{{random_string(6)}}
          value: {{random_string(6)}}
  
  return:
    output@text:
      {% for key, value in cerb_placeholders_list('random_') %}
      random_{{key}}: {{value}}
      {% endfor %}
{% endraw %}
```
{% endtab %}

{% tab iterate_placeholders output %}
```cerb
{% raw %}
__return:
  output: |
    random_9QVUFG: 9UA12E
    random_3518J5: P42E5N
    random_5AP3CY: 4FDYTB
    random_LXYYY2: 5Q2Q66
    random_VCHQPD: F8HRM3
    random_TFSNM3: 1JL253
    random_1D62R3: VTYPX5
    random_FUDWUC: QJVB8C
    random_DQFJPH: QTCUM3
    random_N6P8AK: 8TQR3U
{% endraw %}
```
{% endtab %}

{% endtabs %}