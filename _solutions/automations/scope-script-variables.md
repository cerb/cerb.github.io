---
title: Scope scripting variables
excerpt: Use `with` command to create isolated variable scopes.
summary: This page demonstrates how to use the scripting `with` command to 
  create isolated variable scopes. It shows how to work with variable 
  transformations in different scopes, use variable mapping, and control 
  access to outer scope variables using 'only'.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/scope-script-variables.png
---

{% comment %}
* Creates isolated variable scopes
* Supports variable mapping
* Optional 'only' parameter
* Shows scope visibility
{% endcomment %}

## Basic variable scope with array transformations

The [with](https://twig.symfony.com/doc/3.x/tags/with.html) command creates an isolated scope. Array operations performed inside are not visible outside.

{% tabs scope-script-variables %}
{% tab scope-script-variables automation %}
```cerb
{% raw %}
start:
  set:
    message@text:
      {% set numbers = range(1, 5) %}
      Outside scope numbers are: {{numbers|join(',')}}
      {% with %}
      {% set doubled = numbers|map(n => n * 2) %}
      Inside scope doubled numbers are: {{doubled|join(',')}}
      {% endwith %}
      Doubled numbers are not visible here anymore
  return:
    output@key: message
{% endraw %}
```
{% endtab %}

{% tab scope-script-variables output %}
```cerb
{% raw %}
__return:
  output: |-
    Outside scope numbers are: 1,2,3,4,5
    Inside scope doubled numbers are: 2,4,6,8,10
    Doubled numbers are not visible here anymore
{% endraw %}
```
{% endtab %}
{% endtabs %}

## Using variable mapping

Pass variables directly in the [with](https://twig.symfony.com/doc/3.x/tags/with.html) command using a mapping.

{% tabs scope-script-variables2 %}
{% tab scope-script-variables2 automation %}
```cerb
{% raw %}
start:
  set:
    message@text:
      {% set numbers = range(1, 5) %}
      {% with {tripled: numbers|map(n => n * 3)} %}
      Inside mapping scope tripled numbers are: {{tripled|join(',')}}
      {% endwith %}
  return:
    output@key: message
{% endraw %}
```
{% endtab %}

{% tab scope-script-variables2 output %}
```cerb
{% raw %}
__return:
  output: |
    Inside mapping scope tripled numbers are: 3,6,9,12,15
{% endraw %}
```
{% endtab %}
{% endtabs %}

## Using only to restrict outer scope

The [with](https://twig.symfony.com/doc/3.x/tags/with.html) command creates an isolated scope. Array operations performed inside are not visible outside.

{% tabs scope-script-variables3 %}
{% tab scope-script-variables3 automation %}
```cerb
{% raw %}
start:
  set:
    message@text:
      {% set outer = 'I am not visible' %}
      {% with {inner: 'I am visible'} only %}
      With only: {{inner}}, outer value is not accessible.
      {% endwith %}
  return:
    output@key: message
{% endraw %}
```
{% endtab %}

{% tab scope-script-variables3 output %}
```cerb
{% raw %}
__return:
  output: |
    With only: I am visible, outer value is not accessible.
{% endraw %}
```
{% endtab %}
{% endtabs %}

## Basic variable scope with isolation

The [with](/docs/scripting/commands/#with) command creates an isolated scope. Variables defined inside are not visible in the outer scope.

{% tabs scope-script-variables4 %}
{% tab scope-script-variables4 automation %}
```cerb
{% raw %}
start:
  set:
    message@text:
      {% with %}
      {% set name = 'Kina' -%}
      Hi, {{name}}!
      {% endwith %}
      {% if name is empty %}
      Where did you go?
      {% endif %}
  return:
    output@key: message
{% endraw %}
```
{% endtab %}

{% tab scope-script-variables4 output %}
```cerb
{% raw %}
__return:
  output: |
    Hi, Kina!
    Where did you go?
{% endraw %}
```
{% endtab %}
{% endtabs %}