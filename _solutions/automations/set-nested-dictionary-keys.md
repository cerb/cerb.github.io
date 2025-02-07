---
title: Set nested dictionary keys
excerpt: Use the `dict_set()` function to set deeply nested keys in dictionaries.
summary: This page demonstrates how to use the `dict_set()` function to set 
  deeply nested keys in dictionaries. It shows how to construct complex nested 
  data structures by setting values at specific paths within a dictionary.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/set-nested-dictionary-keys.png
---

{% comment %}
* Uses `dict_set()` function
* Sets deep nested values
* Constructs complex dictionaries
* Maintains dictionary structure
{% endcomment %}

## Using dict_set() function

Here is an example of using the [dict_set()](/docs/scripting/functions/#dict_set) function to set deeply nested keys in dictionaries.

{% tabs set-nested-dictionary-keys %}
{% tab set-nested-dictionary-keys automation %}
```cerb
{% raw %}
start:
  set:
    worker@json:
      {% set var = {"group": {}} %}
      {% set var = dict_set(var, 'group.name', 'Support') %}
      {% set var = dict_set(var, 'group.manager.name.first', 'Kina') %}
      {% set var = dict_set(var, 'group.manager.name.last', 'Halpue') %}
      {{var|json_encode}}
  return:
    worker@key: worker
{% endraw %}
```
{% endtab %}

{% tab set-nested-dictionary-keys output %}
```cerb
{% raw %}
__return:
  worker:
    group:
      name: Support
      manager:
        name:
          first: Kina
          last: Halpue
{% endraw %}
```
{% endtab %}
{% endtabs %}