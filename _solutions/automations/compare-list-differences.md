---
title: Compare list differences
excerpt: Use the `array_diff()` function to find elements unique to a list.
summary: This page demonstrates how to use the `array_diff()` function to 
  find elements that exist in one list but not another. This is useful for 
  identifying new or missing items between two sets of data.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/compare-list-differences.png
---

{% comment %}
* Uses `array_diff()` function
* Compares two lists
* Identifies unique elements
{% endcomment %}

## Using array_diff() function

Here is an example of using the [array_diff()](/docs/scripting/functions/#array_diff) function to find elements that exist in the second array but not in the first.

{% tabs compare-list-differences %}
{% tab compare-list-differences automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    array1@csv: Apple, Google, Microsoft
    array2@csv: Apple, Microsoft, Cerb
    diff@csv: {{array_diff(array2, array1)|join(', ')}}
  return:
    output: These are new: {{diff|join(', ')}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab compare-list-differences output %}
{% highlight yaml %}
{% raw %}
__return:
  output: 'These are new: Cerb'
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}