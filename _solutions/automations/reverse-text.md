---
title: Reverse text or lists
excerpt: Reverse any given text or list using scripting.
summary: This page demonstrates the use of the `|reverse` function in Cerb scripting
  to reverse text or list elements. The syntax can be used with a boolean value (`true`)
  to preserve array keys.
layout: solution
social_image_url: /assets/images/solutions/automations/reverse-text.png
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
---

You can use [\|reverse](/docs/scripting/filters/#reverse) in scripting to reverse any given block of text or list. ```|reverse(true)``` will do so while preserving array keys. 

{% tabs reverse_text %}

{% tab reverse_text automation %}
```cerb
{% raw %}
start:
  return:
    reversed_list@csv: {{[1,2,3,4,5]|reverse|join(',')}}
    reversed_text: {{"This is text to reverse."|reverse}}
{% endraw %}
```
{% endtab %}

{% tab reverse_text output %}
```cerb
{% raw %}
__return:
  reversed_list:
  - "5"
  - "4"
  - "3"
  - "2"
  - "1"
  reversed_text: .esrever ot txet si sihT
{% endraw %}
```
{% endtab %}

{% endtabs %}
