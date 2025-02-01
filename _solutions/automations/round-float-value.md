---
title: Round floating point numbers
excerpt: Various rounding methods to format decimal numbers in automation scripting.
summary: This page demonstrates different ways to round floating point numbers in
  automation scripting. It covers basic rounding, ceiling, floor, and precision control
  using Pi as an example. The examples show how to use different rounding methods
  to achieve desired numeric formatting in a scripting context.
layout: solution
jumbotron: []
social_image_url: /assets/images/solutions/automations/round-float-value.png
redirect_from:
- /automation/cookbook/round-float-value/
---

{% comment %}
* Rounding methods: ceil, floor, and standard rounding
* Precision control for decimal places
* Mathematical constants and irrational numbers
{% endcomment %}

## Using different rounding methods

Here are examples of rounding methods (round, ceil, floor, and precision control) for floating point numbers in automation scripting.

{% tabs round_float_value %}

{% tab round_float_value automation %}
```cerb
{% raw %}
start:
  set:
    number@float: 3.1415926535897932384626433832795028841971693993751
  return:
    round@int: {{number|round}}
    ceil@int: {{number|round(0, 'ceil')}}
    floor@int: {{number|round(0, 'floor')}}
    precision@float: {{number|round(5)}}
{% endraw %}
```
{% endtab %}

{% tab round_float_value output %}
```cerb
{% raw %}
__return:
  round: 3
  ceil: 4
  floor: 3
  precision: 3.14159
{% endraw %}
```
{% endtab %}

{% endtabs %}
