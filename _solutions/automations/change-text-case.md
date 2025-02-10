---
title: Change text case
excerpt: Change the case time of given text using scripting.
summary: This page outlines the various filters in Cerb scripting for changing the case
  type of a given text string, including `|upper` and `|lower` for converting to uppercase
  and lowercase respectively, `|capitalize` for capitalizing the first word, and `|title`
  for capitalizing every word. The examples demonstrate how these pipes can be used
  in an automation script with output formats that preserve leading whitespace and
  initial capitalization.
social_image_url: /assets/images/solutions/automations/change-text-case.png
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

Cerb has several [filters](/docs/scripting/filters/) you can use to change the case of a given text string:

* [\|upper](/docs/scripting/filters/#upper) and [\|lower](/docs/scripting/filters/#lower) will change the string to upper and lower case respectively.

* [\|capitalize](/docs/scripting/filters/#capitalize) will capitalize the first word in the string.

* [\|title](/docs/scripting/filters/#title) will capitalize every word.

{% tabs change_text_case %}

{% tab change_text_case automation %}
```cerb
{% raw %}
start:
  set:
    sentence: This is a sentence.
  return:
    upper: {{sentence|upper}}
    lower: {{sentence|lower}}
    capitalized: {{sentence|capitalize}}
    title: {{sentence|title}}
{% endraw %}
```
{% endtab %}

{% tab change_text_case output %}
```cerb
{% raw %}
__return:
  upper: THIS IS A SENTENCE.
  lower: this is a sentence.
  capitalized: This is a sentence.
  title: This Is A Sentence.
{% endraw %}
```
{% endtab %}

{% endtabs %}
