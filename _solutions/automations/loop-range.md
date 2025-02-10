---
title: Loop through a range of numbers
excerpt: Loop through a range of numbers with an optional step value.
summary: 'This page describes the use of Cerb''s `range()` function, which allows looping
  through a set range of numbers. The `range` function can be used in two ways: as
  an automation command to loop through numbers and output them, or to generate a
  list of numbers for return. Additionally, the `step` command is introduced, allowing
  users to skip certain numbers with each step.'
social_image_url: /assets/images/solutions/automations/loop-range.png
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

## Loop through a numeric range

With the [range()](/docs/scripting/functions/#range) function, you can loop through a set range of numbers.

{% tabs loop_numbers %}

{% tab loop_numbers automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% for n in range(1,5) %}
      {{n}}...
      {% endfor %}
{% endraw %}
{% endhighlight %}
{% endtab %}

## Loop through a range with a step value

{% tab loop_numbers output %}
{% highlight cerb %}
{% raw %}
__return:
  output: |
    1...
    2...
    3...
    4...
    5...
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}

With the `step` command, you can skip a certain number with each step. For example, `step=2` will return every second number in the range.

{% tabs step_range %}

{% tab step_range automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    output@text:
      {% for n in range(1,10,step=2) %}
      {{n}}...
      {% endfor %}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab step_range output %}
{% highlight cerb %}
{% raw %}
__return:
  output: |
    1...
    3...
    5...
    7...
    9...
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}