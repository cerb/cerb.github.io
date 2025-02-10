---
title: Calculate length
excerpt: Calculate the length of a list or string using scripting.
summary: 'This page documents the use of the `|length` syntax in Cerb automation
  scripting, which allows you to calculate the length of any list or text string.'
layout: solution
social_image_url: /assets/images/solutions/automations/calculate-length.png
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

With [\|length](/docs/scripting/filters/#length) you can calculate the length of any list or text string.

{% tabs calculate_length %}

{% tab calculate_length automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    list_len@int: {{[1,2,3,4,5,6,7,8,9,10]|length}}
    text_len@int: {{'This is some text'|length}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab calculate_length output %}
{% highlight yaml %}
{% raw %}
__return:
  list_len: 10
  text_len: 17
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}
