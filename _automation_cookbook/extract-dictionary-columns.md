---
title: Extract dictionary columns
excerpt: Extract a column from a list of dictionaries
layout: automation-cookbook
jumbotron: []
social_image_url: /assets/images/automation-cookbook/extract-dictionary-columns.png
---

## Using |column

You can extract the same column from a list of dictionaries with the `|column` filter.

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
  return:
    emails: {{people|column('email')|join(', ')}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  emails: kina@cerb.example, milo@cerb.example
{% endraw %}
```
{% endtab %}

{% endtabs %}

## Using |map

You can extract the same column from a list of dictionaries with the `|map` filter.

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
  return:
    emails: {{people|map((v)=>v['email'])|join(', ')}}
{% endraw %}
```
{% endtab %}

{% tab example output %}
```cerb
{% raw %}
__return:
  emails: kina@cerb.example, milo@cerb.example
{% endraw %}
```
{% endtab %}

{% endtabs %}