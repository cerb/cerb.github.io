---
title: Shuffle lists and strings
excerpt: Use the `shuffle` function to randomly reorder lists and strings.
summary: This page demonstrates how to use the `shuffle` function to randomly reorder 
  elements in lists and strings. It shows examples of shuffling both numerical arrays 
  and text strings, illustrating how to create randomized sequences.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/shuffle-list-string.png
---

{% comment %}
* Demonstrates list shuffling
* Shows string shuffling
* Creates random sequences
{% endcomment %}

## Shuffling lists and strings

Here is an example of using the [shuffle](/docs/scripting/functions/#shuffle) function to randomly reorder elements in both lists and strings.

{% tabs shuffle-list-string %}
{% tab shuffle-list-string automation %}
{% highlight cerb %}
{% raw %}
start:
  return:
    shuffled_list: {{shuffle([1,2,3,4,5,6,7,8,9,10])|json_encode}}
    shuffled_text: {{shuffle("abcdefghijklmnopqrstuvwxyz"|split(''))|join('')}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab shuffle-list-string output %}
{% highlight yaml %}
{% raw %}
__return:
  shuffled_list: '[2,4,5,1,7,10,8,9,6,3]'
  shuffled_text: wrgpudtahnqjemklsfizoybvcx
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}