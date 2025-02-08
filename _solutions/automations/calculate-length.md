---
title: Calculate length
excerpt: Calculate the length of a list or string using scripting
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
With ```|length``` you can calculate the length of any list or text string.

{% tabs calculate_length %}

{% tab calculate_length automation %}
```cerb
{% raw %}
start:
  return:
    list_len@int: {{[1,2,3,4,5,6,7,8,9,10]|length}}
    text_len@int: {{'This is some text'|length}}
{% endraw %}
```
{% endtab %}

{% tab calculate_length output %}
```cerb
{% raw %}
__return:
  list_len: 10
  text_len: 17
{% endraw %}
```
{% endtab %}

{% endtabs %}
