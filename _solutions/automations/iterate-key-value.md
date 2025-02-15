---
title: Iterate objects with key and value
excerpt: Iterate though a set of objects with both keys and values with repeat
summary: 
layout: solution
permalink: /solutions/automations/iterate-key-value
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

When using `repeat`, if you render the `as` in the form of `key, valuue`, it will set two placeholders in the iterated value. This can be useful if you want to access both items easily in the following commands.


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
