---
title: Sum or multiply an array of numbers
excerpt: Use `array_sum` and `reduce` to calculate the sum or product of an array of numbers.
summary: This page provides a solution for calculating the sum and product of an array of numbers using Cerb scripting. It showcases two examples, one where the script is written as part of an automation process and another where it is provided as output from a previous calculation. The solution utilizes the `array_sum()` function to calculate the sum and the `|reduce` filter to calculate the product of the input numbers.
layout: solution
social_image_url: /assets/images/solutions/automations/array-sum.png
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

## Using array_sum() and |reduce

You can use [array_sum()](/docs/scripting/functions/#array_sum) and [\|reduce](/docs/scripting/filters/#reduce) to calculate the sum or product of an array of numbers and reduce the output to that single result.

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