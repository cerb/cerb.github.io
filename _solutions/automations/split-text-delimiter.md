---
title: Split text with delimiter
excerpt: Use the `|split` filter to divide text into arrays using delimiters.
summary: This page demonstrates how to use the `|split` filter to divide text strings
  into arrays using various delimiters. It shows examples of splitting comma-separated
  lists, URIs, paths, and text into equal chunks.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/split-text-delimiter.png
---

{% comment %}
* Demonstrates text splitting
* Shows different delimiter types
* Uses split limit parameter
{% endcomment %}

## Split text with delimiters

Here is an example of using the [\|split](/docs/scripting/filters/#split) filter to divide text using different delimiters.

{% tabs split-text-delimiter %}
{% tab split-text-delimiter automation %}
```cerb
{% raw %}
start:
  return:
    split_list@json: {{"1,2,3"|split(',')|json_encode}}
    split_uris@json: {{"cerb:ticket:123"|split(':')|json_encode}}
    split_limit@json: {{"/usr/share/html/cerb/storage/"|trim('/')|split('/', limit=2)|json_encode}}
    split_chunks@json: {{"abcdefgh"|split('',limit=2)|json_encode}}
{% endraw %}
```
{% endtab %}

{% tab split-text-delimiter output %}
```cerb
{% raw %}
__return:
  split_list:
  - "1"
  - "2"
  - "3"
  split_uris:
  - cerb
  - ticket
  - "123"
  split_limit:
  - usr
  - share/html/cerb/storage
  split_chunks:
  - ab
  - cd
  - ef
  - gh
{% endraw %}
```
{% endtab %}
{% endtabs %}