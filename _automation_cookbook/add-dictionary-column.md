---
title: Add a column to dictionaries
excerpt: Use `|merge` filter to add new columns to dictionaries.
summary: This page demonstrates how to use the merge filter to add new columns 
  to existing dictionaries. The example shows adding random age values to a 
  list of people, illustrating dictionary manipulation techniques.
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/add-dictionary-column.png
---

{% comment %}
* Adds new properties to existing dictionaries
* Supports dynamic value generation
* Maintains original dictionary structure
* Demonstrates merge filter usage
{% endcomment %}

## Using |merge filter

The [\|merge](/docs/scripting/filters/#merge) filter combines two arrays or objects. We can use it in [\|map](/docs/scripting/filters/#map) to add new columns to dictionaries.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    people:
      kina:
        name: Kina Halpue
        email: kina@cerb.example
      milo:
        name: Milo Dade
        email: milo@cerb.example
  set/merge:
    people@json: {{people|map((v) => v|merge({'age':random(20,65)}))|json_encode}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
people:
  kina:
    name: Kina Halpue
    email: kina@cerb.example
    age: 24
  milo:
    name: Milo Dade
    email: milo@cerb.example
    age: 38
{% endraw %}
```
{% endtab %}

{% endtabs %}