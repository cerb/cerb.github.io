---
title: Filter array values
excerpt: Use the `|filter` modifier with arrow functions to match specific array values.
summary: This page demonstrates how to use the filter modifier with arrow functions
  in automation scripting to filter array values based on conditions. It shows how
  to use lambda expressions to create flexible filtering rules for lists of data.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/filter-array-values.png
redirect_from:
- /automation/cookbook/filter-array-values/
---

{% comment %}
* Array filtering techniques
* Arrow function usage
* Mathematical operations
* List processing
* Conditional filtering
* Filtering out null/blank
{% endcomment %}

## Filtering multiples of 5

Here is an example of using the [\|filter](https://cerb.ai/docs/scripting/filters#filter) modifier with arrow functions to filter array values based on conditions in automation scripting.

{% tabs filter_array_values %}

{% tab filter_array_values automation %}
```cerb
{% raw %}
start:
  set:
    numbers@csv: {{range(1, 100)|join(',')}}
  return:
    multiples5@csv: {{numbers|filter((n,k) => 0 == n % 5)|join(',')}}
{% endraw %}
```
{% endtab %}

{% tab filter_array_values output %}
```cerb
{% raw %}
__return:
  multiples5:
  - "5"
  - "10"
  - "15"
  - "20"
  - "25"
  - "30"
  - "35"
  - "40"
  - "45"
  - "50"
  - "55"
  - "60"
  - "65"
  - "70"
  - "75"
  - "80"
  - "85"
  - "90"
  - "95"
  - "100"
{% endraw %}
```
{% endtab %}

{% endtabs %}
