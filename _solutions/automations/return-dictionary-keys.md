---
title: Return dictionary keys
excerpt: Use the `|keys` filter to get a list of dictionary property names.
summary: This page demonstrates how to use the `|keys` filter to extract property names 
  from dictionaries and arrays. The example shows how to retrieve and format a list 
  of keys from a dictionary containing contact information.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/return-dictionary-keys.png
---

{% comment %}
* Extracts dictionary keys
* Formats key list output
* Demonstrates key filtering
* Shows key joining options
{% endcomment %}

## Using |keys filter

Here is an example of using the [\|keys](/docs/scripting/filters/#keys) filter to get a list of property names from a dictionary.

{% tabs return-dictionary-keys %}
{% tab return-dictionary-keys automation %}
```cerb
{% raw %}
start:
  set:
    person:
      name_first: Kina
      name_last: Halpue
      email: kina.halpue@cerb.example
  return:
    keys@csv: {{person|keys|join(', ')}}
{% endraw %}
```
{% endtab %}

{% tab return-dictionary-keys output %}
```cerb
{% raw %}
__return:
  keys:
  - name_first
  - name_last
  - email
{% endraw %}
```
{% endtab %}
{% endtabs %}