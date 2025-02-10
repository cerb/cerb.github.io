---
title: Compare with operators
excerpt: Use comparison operators to evaluate values.
summary: This page demonstrates how to use various comparison operators to 
  evaluate and compare values. It shows examples of equality, inequality, 
  less than, greater than or equal to, and membership testing using 'in' operators.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/compare-with-operators.png
---

{% comment %}
* Demonstrates comparison operators
* Shows boolean evaluation
* Includes array membership testing
{% endcomment %}

## Using comparison operators

Here are examples of using different comparison [operators](/docs/scripting/operators/) to evaluate values.

{% tabs compare-with-operators %}
{% tab compare-with-operators automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    eq@bool: {{1 == 1}}
    not_eq@bool: {{1 != 2}}
    lt@bool: {{50 < 100}}
    gte@bool: {{100 >= 2}}
    in@bool: {{5 in [1,2,3,4,5,6]}}
    nin@bool: {{100 not in [1,2,3]}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab compare-with-operators output %}
{% highlight cerb %}
{% raw %}
__return:
  eq: true
  not_eq: true
  lt: true
  gte: true
  in: true
  nin: true
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}