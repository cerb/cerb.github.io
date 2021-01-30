---
title: "Bot Scripting Reference: Tests"
excerpt: A reference of the template tests in bot scripting.
permalink: /docs/bots/scripting/tests/
toc:
  title: Tests
jumbotron:
  title: "Reference: Tests"
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

A **test** is an expression that returns a boolean value (`true` or `false`).

Tests are performed using the `is` and `is not` operators.

When used as output, a test returns `1` for `true`, and nothing for `false`.

These tests are available in bot scripts and snippets:

* TOC
{:toc}

## empty

The **empty** test checks if a variable is an empty string, empty array, empty object, false, or null.

<pre>
<code class="language-twig">
{% raw %}
"": {{"" is empty}}
[]: {{[] is empty}}
{}: {{{ } is empty}}
false: {{false is empty}}
not something: {{"something" is not empty}}
{% endraw %}
</code>
</pre>

```
"": 1
[]: 1
{}: 1
false: 1
not something: 1 
```

## even

The **even** test checks if a numeric variable is even.

<pre>
<code class="language-twig">
{% raw %}
1: {{1 is even ? 'even' : 'odd'}}
2: {{2 is even ? 'even' : 'odd'}}
{% endraw %}
</code>
</pre>

```
1: odd
2: even
```

## iterable

The **iterable** test checks if a variable is an array or iterable object.

<pre>
<code class="language-twig">
{% raw %}
123: {{123 is iterable ? 'iterable' : 'not iterable'}}
[1,2,3]: {{[1,2,3] is iterable ? 'iterable' : 'not iterable'}}
{% endraw %}
</code>
</pre>

```
123: not iterable
[1,2,3]: iterable
```

## null

The **null** test checks if a variable is `null`.

<pre>
<code class="language-twig">
{% raw %}
undefined: {{unknownVariable is null ? 'null' : 'defined'}}
123: {{123 is null ? 'null' : 'constant'}}
{% set name = 'Kina Halpue' %}
name: {{name is null ? 'null' : 'defined'}}
{% endraw %}
</code>
</pre>

```
undefined: null
123: constant
name: defined
```

## numeric

The **numeric** test checks if a variable is numeric.

<pre>
<code class="language-twig">
{% raw %}
123: {{123 is numeric ? 'numeric' : 'not numeric'}}
abc: {{"abc" is numeric ? 'numeric' : 'not numeric'}}
[1,2,3]: {{[1,2,3] is numeric ? 'numeric' : 'not numeric'}}
{% endraw %}
</code>
</pre>

```
123: numeric
abc: not numeric
[1,2,3]: not numeric
```

## odd

The **odd** test checks if a numeric variable is odd.

<pre>
<code class="language-twig">
{% raw %}
1: {{1 is even ? 'even' : 'odd'}}
2: {{2 is even ? 'even' : 'odd'}}
{% endraw %}
</code>
</pre>

```
1: odd
2: even
```

## pattern

The **pattern** test checks if a variable matches any pattern in a set.

The variable can be a string or an array. The test accepts one or more patterns where asterisks (`*`) denote wildcards.

<pre>
<code class="language-twig">
{% raw %}
{% set recipient = "support@cerb.example" %}
{{recipient is pattern ("support@*", "*@example.com")}}
{% endraw %}
</code>
</pre>

```
1
```

## prefixed

The **prefixed** test checks if a string variable starts with any pattern in a set.

The test accepts one or more patterns.

<pre>
<code class="language-twig">
{% raw %}
{% set subject = "[Bugs] New issue reported" %}
{{subject is prefixed ("[Bugs]")}}
{% endraw %}
</code>
</pre>

```
1
```

## same as

The **same as** test checks if two variables are of the same exact type and value. This avoids type coercion (e.g. converting strings to numbers).

<pre>
<code class="language-twig">
{% raw %}
{% set number = 1 %}
{% set string = "1" %}
{{number is same as string ? 'same' : 'not same'}}
{% endraw %}
</code>
</pre>

```
not same
```

## suffixed

The **suffixed** test checks if a string variable ends with any pattern in a set.

The test accepts one or more patterns.

<pre>
<code class="language-twig">
{% raw %}
{% set domain = "cerb.ai" %}
{{domain is suffixed (".ai", ".com")}}
{% endraw %}
</code>
</pre>

```
1
```
