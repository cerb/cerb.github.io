---
title: Map array values
excerpt: Use the `|map` modifier with arrow functions to transform array values.
summary: This page demonstrates how to use the map modifier with arrow functions in
  automation scripting to transform array values. It shows how to use lambda expressions
  to apply mathematical operations and transformations to lists of numbers.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/map-array-values.png
redirect_from:
- /automation/cookbook/map-array-values/
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

{% tabs map_array_values %}

{% tab map_array_values automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    numbers@csv: {{range(1, 10)|join(',')}}
  return:
    squares@json: {{numbers|map((n) => n ** 2)|json_encode}}
    cubes@json: {{numbers|map((n) => n ** 3)|json_encode}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab map_array_values output %}
{% highlight yaml %}
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
{% endhighlight %}
{% endtab %}

{% endtabs %}
