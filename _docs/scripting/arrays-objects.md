---
title: 'Scripting Reference: Arrays and Objects'
excerpt: This page serves as a scripting reference for working with arrays and objects
  in Cerb.
summary: This page serves as a scripting reference for working with arrays and objects
  in Cerb. It explains how to create and manipulate arrays, which are lists of values
  indexed numerically, and objects, which are collections of key-value pairs. The
  page provides examples of accessing and modifying elements within arrays and objects
  using dot notation and brackets. It also covers advanced operations such as setting
  deeply nested keys, appending items to arrays, and computing the difference between
  two arrays using the `array_diff()` function. The reference includes practical code
  snippets to illustrate these concepts, making it a useful guide for developers working
  with Cerb's scripting capabilities.
permalink: /docs/scripting/arrays-objects/
toc:
  title: Arrays and Objects
  expand: Developer Guide
jumbotron:
  title: Arrays and Objects
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

# Arrays

An **array** is a list of values in a single variable.  You create an array by providing multiple values within brackets (`[...]`) and separating them with commas.

Arrays are _numerically indexed_ starting with zero.  You can access individual array elements with a dot (`.`) or brackets (`[]`).

For example:

{% highlight twig %}
{% raw %}
{% set colors = ['red','green','blue'] %}
Item 0 is {{colors.0}}
Item 2 is {{colors[2]}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Item 0 is red
Item 2 is blue
{% endhighlight %}

# Objects

**Objects** are similar to arrays, except that the items are indexed with a **key** and you wrap them in curly braces (`{}`):

{% highlight twig %}
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{{person.first_name}} {{person.last_name}} is {{person.age}}.
{% endraw %}
{% endhighlight %}

{% highlight text %}
William Portcullis is 63.
{% endhighlight %}

### Dynamic keys

You can specify an object key with a variable by using brackets (`[]`):

{% highlight twig %}
{% raw %}
{% set person = {
	"first_name": "William",
	"last_name": "Portcullis",
	"age": 63
} %}
{% set key = 'first_name' %}
His name is {{person[key]}}.
{% endraw %}
{% endhighlight %}

{% highlight text %}
His name is William.
{% endhighlight %}

# Modifying arrays and objects

You can use the [dict_set()](/docs/scripting/functions/#dict_set) function to quickly modify, append, or remove items from an array or object.

You can set deeply nested keys in a single line using dot-notation:

{% highlight twig %}
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.manager.name.first', 'Kina') %}
{% set var = dict_set(var, 'group.manager.name.last', 'Halpue') %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight json %}
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
{% endhighlight %}

Append items to an array by adding `.[]` to the key:

{% highlight twig %}
{% raw %}
{% set var = {"group": {}} %}
{% set var = dict_set(var, 'group.name', 'Support') %}
{% set var = dict_set(var, 'group.members.[]', 'Kina Halpue') %}
{% set var = dict_set(var, 'group.members.[]', 'William Portcullis') %}
{% set var = dict_set(var, 'group.members.[]', 'Steven Emplois') %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight json %}
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
{% endhighlight %}

Append to nested arrays:

{% highlight twig %}
{% raw %}
{% set var = [1,2,[3,4,[5,6]]] %}
{% set var = dict_set(var, '2.2.[]', 7) %}
{% set var = dict_set(var, '2.2.[]', 8) %}
{% set var = dict_set(var, '2.3', 9) %}
{{var|json_encode|json_pretty}}
{% endraw %}
{% endhighlight %}

{% highlight json %}
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
{% endhighlight %}

# Compute the difference of two arrays

The [array_diff()](/docs/scripting/functions/#array_diff) function returns the items in the second array that are not present in the first array:

{% highlight twig %}
{% raw %}
{% set arr1 = ['Apple', 'Google', 'Microsoft'] %}
{% set arr2 = ['Apple', 'Microsoft', 'Cerb'] %}
{% set diff = array_diff(arr2, arr1) %}
These are new: {{diff|join(', ')}}
{% endraw %}
{% endhighlight %}

{% highlight text %}
These are new: Cerb
{% endhighlight %}

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/strings/" class="prev">&lt; Strings</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/dates/" class="prev">Dates &gt;</a>
	</div>
</div>
<div class="clear"></div>