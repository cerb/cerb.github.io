---
title: Append values to arrays and lists
excerpt: Add new values to existing arrays and lists.
summary: This page demonstrates various techniques for appending values to arrays
  and lists in Cerb automations, including using var.push, var.set, merge filters,
  and CSV concatenation. Each method offers different benefits depending on your use
  case.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/append-array-list.png
redirect_from:
- /automation/cookbook/append-array-list/
---

{% comment %}
* Uses var.push for direct array manipulation
* Uses var.set for indexed appending
* Supports merge filter for array combining
* Handles CSV string concatenation
{% endcomment %}

Here are examples of different methods for appending values to arrays and lists in automation scripting.

## Using var.push:

{% highlight cerb %}
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  var.push:
    inputs:
      key: emails
      value: marketing@cerb.example
{% endraw %}
{% endhighlight %}

## Using var.set:

{% highlight cerb %}
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  var.set:
    inputs:
      key: emails:{{emails|length}}
      value: marketing@cerb.example
{% endraw %}
{% endhighlight %}

## Using |merge:

{% highlight cerb %}
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  set/append:
    emails@json: {{emails|merge(['marketing@cerb.example'])|json_encode}}
{% endraw %}
{% endhighlight %}

## Using |csv and string concatenation:

{% highlight cerb %}
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  set/append:
    emails@csv: {{emails|join(',')}}, marketing@cerb.example
{% endraw %}
{% endhighlight %}