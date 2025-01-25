---
title: Create an array of random numbers
excerpt: Generate an array filled with random numeric values.
summary: "This page demonstrates how to create an array of random numbers using range mapping and the random function in Cerb. It provides a step-by-step example, including using `range()` for array size, applying `map()` for random value generation, and JSON encoding for output format, resulting in an array filled with unique random numbers."
layout: automation-cookbook
jumbotron: []
---

{% comment %}
* Uses range() for array size
* Applies map() for random value generation
* JSON encoding for output format
{% endcomment %}

## Generate random numbers

This automation generates an array of 10 random numbers between 0 and 100 (inclusive).

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  return:
    values@json: {{range(1, 10)|map((v) => random(0, 100))|json_encode}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  values:
  - 30
  - 18
  - 50
  - 39
  - 89
  - 73
  - 98
  - 90
  - 72
  - 37
{% endraw %}
```
{% endtab %}

{% endtabs %}