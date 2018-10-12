---
title: Bot Scripting Arrays and Objects
excerpt: 
permalink: /docs/bots/scripting/arrays-objects/
toc:
  title: Arrays/Objects
jumbotron:
  title: Arrays/Objects
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Scripting &raquo;
    url: /docs/bots/scripting/
---

# Arrays

An **array** is a list of values in a single variable.  You create an array by providing multiple values within brackets (`[...]`) and separating them with commas.

Arrays are _numerically indexed_ starting with zero.  You can access individual array elements with a dot (`.`) or brackets (`[]`).

For example:

<pre>
<code class="language-twig">
{% raw %}
{% set colors = ['red','green','blue'] %}
Item 0 is {{colors.0}}
Item 2 is {{colors[2]}}
{% endraw %}
</code>
</pre>

```
Item 0 is red
Item 2 is blue
```

# Objects

**Objects** are similar to arrays, except that the items are indexed with a **key** and you wrap them in curly braces (`{}`):

<pre>
<code class="language-twig">
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{{person.first_name}} {{person.last_name}} is {{person.age}}.
{% endraw %}
</code>
</pre>

```
William Portcullis is 63.
```

### Dynamic keys

You can specify an object key with a variable by using brackets (`[]`):

<pre>
<code class="language-twig">
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{% set key = 'first_name' %}
His name is {{person[key]}}.
{% endraw %}
</code>
</pre>

```
His name is William.
```

# Modifying arrays and objects

You can use the [dict_set()](/docs/bots/scripting/functions/#dict_set) function to quickly modify, append, or remove items from an array or object.

You can set deeply nested keys in a single line using dot-notation:

<pre>
<code class="language-twig">
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.manager.name.first', 'Kina') %}
{% set var = dict_set(var, 'group.manager.name.last', 'Halpue') %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "group": {
    "name": "Support",
    "manager": {
      "name": {
        "first": "Kina",
        "last": "Halpue"
      }
    }
  }
}
```

Append items to an array by adding `.[]` to the key:

<pre>
<code class="language-twig">
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.members.[]', 'Kina Halpue') %}
{% set var = dict_set(var, 'group.members.[]', 'William Portcullis') %}
{% set var = dict_set(var, 'group.members.[]', 'Steven Emplois') %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
{
  "group": {
    "name": "Support",
    "members": [
      "Kina Halpue",
      "William Portcullis",
      "Steven Emplois"
    ]
  }
}
```

Append to nested arrays:

<pre>
<code class="language-twig">
{% raw %}
{% set var = [1,2,[3,4,[5,6]]] %}
{% set var = dict_set(var, '2.2.[]', 7) %}
{% set var = dict_set(var, '2.2.[]', 8) %}
{% set var = dict_set(var, '2.3', 9) %}
{{var|json_encode|json_pretty}}
{% endraw %}
</code>
</pre>

```
[
  1,
  2,
  [
    3,
    4,
    [
      5,
      6,
      7,
      8
    ],
    9
  ]
]
```

# Compute the difference of two arrays

The [array_diff()](/docs/bots/scripting/functions/#array_diff) function returns the items in the second array that are not present in the first array:

<pre>
<code class="language-twig">
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set diff = array_diff(arr2, arr1) %}
These are new: {{diff|join(', ')}}
{% endraw %}
</code>
</pre>

```
These are new: Cerb
```