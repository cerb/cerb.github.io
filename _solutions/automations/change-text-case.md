---
title: Change text case
excerpt: Change the case time of given text using scripting
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

Cerb has many pipes you can use to change the case type of a given text string:

```|upper``` and ```|lower``` will change the string to upper and lower case respectively.

```|capitalize``` will capitalize the first word in the string.

```|title``` will capitalize every word.

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
