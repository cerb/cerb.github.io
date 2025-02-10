---
title: Batch list items into sets
excerpt: Use `|batch` filter to split lists into smaller sets of items.
summary: This page demonstrates how to use the `|batch` filter to split 
  a list into smaller sets of a specified size. The example shows 
  splitting a list of numbers into groups of three, using -1 as a 
  fill value for the incomplete final batch.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/batch-list-items.png
---

{% comment %}
* Splits lists into smaller batches
* Supports custom batch sizes
* Can fill incomplete batches
* Useful for bulk processing
{% endcomment %}

## Using |batch filter

The [\|batch](/docs/scripting/filters/#batch) filter divides a list into smaller sets. These sets can be specified to a size, incomplete sets can be filled with a default value, and original array keys can be preserved or not.

{% tabs batch-list-items %}
{% tab batch-list-items automation %}
{% highlight cerb %}
{% raw %}
start:
  set:
    items@json: [1,2,3,4,5,6,7,8,9,10]
  return:
    batches: {{items|batch(size=3, fill=-1, preserve_keys=false)|json_encode}}
{% endraw %}
{% endhighlight %}
{% endtab %}

{% tab batch-list-items output %}
{% highlight yaml %}
{% raw %}
__return:
  batches: '[[1,2,3],[4,5,6],[7,8,9],[10,-1,-1]]'
{% endraw %}
{% endhighlight %}
{% endtab %}
{% endtabs %}