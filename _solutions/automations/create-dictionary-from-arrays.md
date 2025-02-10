---
title: Create a dictionary from arrays
excerpt: Use `array_combine()` to create a dictionary from lists of keys and values.
summary: This page demonstrates how to use the `array_combine()` function to create
  a dictionary by pairing two arrays - one for keys and one for values. It's useful
  for converting parallel arrays into associative arrays or dictionaries.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/create-dictionary-from-arrays.png
redirect_from:
- /automation/cookbook/create-dictionary-from-arrays/
---

{% comment %}
* Combines parallel arrays into dictionaries
* Pairs keys with corresponding values
* Supports CSV input format
* Creates structured data output
* JSON encoding for output format
{% endcomment %}

## Using array_combine()

Here's an example of using `array_combine()` to create a dictionary from separate key and value lists.

{% tabs create_dictionary_from_arrays %}

{% tab create_dictionary_from_arrays automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    keys@csv: Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    values@csv: 88,45,8,88,76,82,31,100,30,91,19,54
  return:
    report@json: {{array_combine(keys,values)|json_encode}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab create_dictionary_from_arrays output %}
{% highlight cerb %}
{% raw %}
__return:
  report:
    Jan: 88
    Feb: 45
    Mar: 8
    Apr: 88
    May: 76
    Jun: 82
    Jul: 31
    Aug: 100
    Sep: 30
    Oct: 91
    Nov: 19
    Dec: 54
{% endraw %}
{% endhighlight %}
{% endtab %}

{% endtabs %}