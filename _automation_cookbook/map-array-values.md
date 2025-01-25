---
title: Map array values
excerpt: Use the `|map` modifier with arrow functions to transform array values.
summary: This page demonstrates how to use the map modifier with arrow functions in
  automation scripting to transform array values. It shows how to use lambda expressions
  to apply mathematical operations and transformations to lists of numbers.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/map-array-values.png
---

{% comment %}
* Array mapping techniques
* Arrow function usage
* Mathematical operations
* List processing
* Value transformation
{% endcomment %}

## Calculating squares and cubes

Here is an example of using the [\|map](/docs/scripting/filters/#map) modifier with arrow functions to transform array values.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    numbers@csv: {{range(1, 10)|join(',')}}
  return:
    squares@json: {{numbers|map((n) => n ** 2)|json_encode}}
    cubes@json: {{numbers|map((n) => n ** 3)|json_encode}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  squares:
  - 1
  - 4
  - 9
  - 16
  - 25
  - 36
  - 49
  - 64
  - 81
  - 100
  cubes:
  - 1
  - 8
  - 27
  - 64
  - 125
  - 216
  - 343
  - 512
  - 729
  - 1000
{% endraw %}
```
{% endtab %}

{% endtabs %}
