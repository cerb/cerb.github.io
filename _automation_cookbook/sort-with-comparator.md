---
title: Sort with comparator
excerpt: Use the `|sort` filter with arrow functions to create custom sorting rules.
summary: This page demonstrates how to use the sort filter with arrow functions to
  create custom sorting rules for complex data structures. It shows how to sort arrays
  of objects using specific object properties.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/sort-with-comparator.png
---

{% comment %}
* Custom sort comparators
* Arrow function usage
* Object property sorting
* Complex data structures
{% endcomment %}

## Sort objects by key property

Here is an example of using the [\|sort](https://twig.symfony.com/doc/3.x/filters/sort.html) filter with arrow functions to create custom sorting rules.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    example_data@json: 
      [
        {"name": "Item 1", "key": "ZZZ"},
        {"name": "Item 2", "key": "MMM"},
        {"name": "Item 3", "key": "AAA"}
      ]
  return:
    sorted: {{example_data|sort((a,b)=> a.key<=>b.key)|column('name')|join(', ')}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  sorted: Item 3, Item 2, Item 1
{% endraw %}
```
{% endtab %}

{% endtabs %}
