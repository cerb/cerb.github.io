---
title: Iterate objects with key and value
excerpt: Iterate though a set of objects with both keys and values with repeat.
summary: "This page explains how to iterate over objects in Cerb using the `repeat:` 
  command. When using `key, value` in `as:`, it sets two placeholders for accessing 
  each item subsequent commands."
layout: solution
social_image_url: /assets/images/solutions/automations/iterate-key-value.png
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

When using the [`repeat:`](/docs/automations/commands/repeat/) command in [automations](/docs/automations/), you can specify two placeholders separated by a comma in the `as:` option (`key, value`) and they will be set with the respective key and value of each item.

{% tabs iterate_key_value %}

{% tab iterate_key_value automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    data:
      0:
        label: Red
      1:
        label: Green
      2:
        label: Blue
  
  repeat:
    each@key: data
    as: index, obj
    do:
      log: Index: {{index}} Value: {{obj.label}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab iterate_key_value results %}
<div class="cerb-screenshot">
<img src="/assets/images/solutions/automations/iterate-key-value/results.png" class="screenshot">
</div>
{% endtab %}

{% endtabs %}
