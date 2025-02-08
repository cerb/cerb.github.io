---
title: Loop numbers
excerpt: Loop through a range of numbers
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---
With the ```range``` function, you can loop through a set range of numbers.

{% tabs loop_numbers %}

{% tab loop_numbers automation %}
```cerb
{% raw %}
start:
  return:
    output@text:
      {% for n in range(1,5) %}
      {{n}}...
      {% endfor %}
{% endraw %}
```
{% endtab %}

{% tab loop_numbers output %}
```cerb
{% raw %}
__return:
  output: |
    1...
    2...
    3...
    4...
    5...
{% endraw %}
```
{% endtab %}

{% endtabs %}

With the ```step``` command, you can skip a certain number with each step. For example, ```step=2``` will return every second number in the range.

{% tabs step_range %}

{% tab step_range automation %}
```cerb
{% raw %}
start:
  return:
    output@text:
      {% for n in range(1,10,step=2) %}
      {{n}}...
      {% endfor %}
{% endraw %}
```
{% endtab %}

{% tab step_range output %}
```cerb
{% raw %}
__return:
  output: |
    1...
    3...
    5...
    7...
    9...
{% endraw %}
```
{% endtab %}

{% endtabs %}