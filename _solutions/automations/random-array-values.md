---
title: Random array values
excerpt: Generate an array filled with random numeric values.
summary: This page demonstrates how to create an array of random numbers using range
  mapping and the random function in Cerb. It provides a step-by-step example, including
  using `range()` for array size, applying `map()` for random value generation, and
  JSON encoding for output format, resulting in an array filled with unique random
  numbers.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/random-array-values.png
redirect_from:
- /automation/cookbook/random-array-values/
---

{% comment %}
* Uses range() for array size
* Applies map() for random value generation
* JSON encoding for output format
{% endcomment %}

## Generate random numbers

This automation generates an array of 10 random numbers between 0 and 100 (inclusive).

{% tabs random_array_values %}

{% tab random_array_values automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    values@json: {{range(1, 10)|map((v) => random(0, 100))|json_encode}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab random_array_values output %}
{% highlight yaml %}
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
{% endhighlight %}
{% endtab %}

{% endtabs %}