---
title: Calculate an array of numbers
excerpt: Use `array_sum` and `reduce` to calculate the sum of an array of numbers.
summary: 
layout: solution
permalink: /solutions/automations/calculate-array-sum
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations

---

You can use [array_sum](/docs/scripting/functions/#array_sum) and [reduce](/docs/scripting/filters/#reduce) to calculate the sum or product of an array of numbers and reduce the output to that single result.

{% tabs calculate_array_sum %}

{% tab calculate_array_sum automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    numbers@csv: 1, 9, 2002, 4, 27, 2001
  return:
    sum@int: {{array_sum(numbers)}}
    product@int: {{numbers|reduce((carry,n) => carry * n, 1)}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab calculate_array_sum output %}
{% highlight cerb %}
{% raw %}
__return:
  sum: 4044
  product: 3893833944
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}