---
title: KATA
excerpt: KATA is a human-friendly format for modeling structured data that is used
  throughout Cerb to describe configurations, customizations, and automations.
summary: This page provides a comprehensive overview of KATA, a human-friendly format
  used in Cerb for modeling structured data. It explains how KATA is designed to avoid
  common pitfalls associated with YAML, such as automatic data type detection and
  security issues with local objects. The page details KATA's syntax, including indentation,
  key names, values, and annotations, and how these elements are used to build a tree
  of key/value relationships. It also covers the use of references to manage complex
  data structures and provides an annotation reference for various data types and
  operations, such as base64, bool, csv, date, int, json, and more. The page emphasizes
  KATA's flexibility and security, highlighting its ability to handle text blocks,
  comments, and placeholders without requiring escaping or executing external code.
permalink: /docs/kata/
toc:
  title: KATA
jumbotron:
  title: KATA
  tagline: A human-friendly format for modeling structured data
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
---

{% comment %}
<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>
{% endcomment %}

**KATA** (_"Key Annotated Tree of Attributes"_) is a human-friendly format for modeling structured data that is used throughout Cerb (since [9.6](/releases/9.6/)) to describe configurations, customizations, sheets, and automations.

KATA was inspired by YAML[^yaml] but avoids many of its pitfalls[^no-yaml].

|---
| Pitfall | YAML | KATA
|-|-|-
| Data types | YAML attempts to automatically detect data types, which requires the use of double quotes on keys and values to ensure they remain text. For example, `no` becomes `FALSE` and currency/versions (`1.50`) become decimal (`1.5`).| KATA treats all keys and values as text without any type coercion. You never need to use quotes. You can optionally annotate a key to convert its value to a specific type.
| Local objects | YAML allows language-specific tags. In some implementations (PHP, Perl, Python, Ruby) these may be automatically enabled for classes and present a security issue. | KATA never executes or refers to outside code.
| Curly braces | YAML allows objects to be defined on a single line using `{key:value}` syntax. This conflicts with our `{%raw%}{{placeholder}}{%endraw%}` syntax, and requires double quoting, explicit types, or text blocks. | KATA doesn't interpret `{}`, so those characters can be used in values without quoting.
| Text blocks | YAML has a variety of symbols for blocks of text (`|`, `|-`, `>`). The default always preserves the first trailing linefeed and trims the rest. | KATA implies blocks of text by key annotation (e.g. `@text`). The first trailing linefeed is always ignored and the rest are preserved.
| Lists | YAML requires `-` prefixes on list items and is sensitive to indentation. Lists are required for duplicate key names amongst siblings. Mistakes with lists of objects can lead to children being added to the wrong parent. | KATA has `@csv` and `@list` key annotations for text-based lists. Sibling keys can be repeated with unique identifiers and never require list syntax.
| Comments | YAML ignores any text following an unquoted `#` character. | KATA only treats indented lines that begin with `#` as a comment. You do not need to escape the character in values.

* TOC
{:toc}

# Syntax

### Indentation

KATA uses indentation (spaces) to build a tree of key/value relationships.

Key names end with a colon (`:`), which may be followed by either a value, or a set of child keys at a deeper level of indentation.

By convention, the indentation for each level should be two spaces.

{% highlight cerb %}
parent:
  child:
    name:
{% endhighlight %}

### Root

The root of the tree is implicit, so there may be multiple keys at the top-level:

{% highlight cerb %}
picklist:
date_range:
text:
{% endhighlight %}

### Key names

Key names must be unique amongst their siblings, but can be repeated elsewhere.

Key names serve as _declarative_ instructions to a feature using KATA for customization (e.g. dashboard filters, snippet prompts, form interactions, automations). In such cases, the possible keys are predefined by that feature.

A slash (`/`) may be appended to a key name to provide a unique identifier. This format should be read as `type/name:`.

{% highlight cerb %}
options:
  picklist/status:
  picklist/color:
  picklist/group:
{% endhighlight %}

### Values

A key may be followed by a text value rather than children. KATA will not automatically detect its type, which often removes the need for escaping.

{% highlight cerb %}
object:
  color: red
{% endhighlight %}

Values may also contain subsequent colons (`:`), which do not require escaping:

{% highlight cerb %}
widget:
  label: Status:
{% endhighlight %}

### Whitespace

Sibling keys may be separated with blank lines for readability. The blank lines must contain the same indentation as the keys.

{% highlight cerb %}
widget/chart:
  type: chart
  label: Chart
  data: ...

widget/gauge:
  type: gauge
  label: Gauge
  data: ...
{% endhighlight %}

### Key annotations

KATA does not perform [type coercion](https://en.wikipedia.org/wiki/Type_conversion) on key values. It will not unpredictably convert digits to numbers, nor words like `true` or `no` to booleans. All values are treated as text by default.

To manipulate values, a comma-separated list of [annotations](#annotation-reference) may be appended to a key name starting with a `@` character. The annotations are processed in order.

{% highlight cerb %}
{% raw %}
picklist:
  options:
    color@csv: red, green, blue
    multiple@bool: no
    hidden@bool:
      {% if has_access %}
      no
      {% else %}
      yes
      {% endif %}
{% endraw %}
{% endhighlight %}

### Text blocks

When using key annotations, a value may contain multiple lines of text. Most annotations imply a text block (e.g. `@bool`, `@csv`, `@json`, `@list`). The `@text` annotation may be used for arbitrary text without any special handling.

{% highlight cerb %}
{% raw %}
comment:
  content@text:
    This is a comment with
    multiple lines of content.
  author:
    name: Cerb
{% endraw %}
{% endhighlight %}

### Comments

Lines that begin with `#` are treated as comments and are ignored.

{% highlight cerb %}
{% raw %}
picklist:
  # The options from a placeholder
  options:
    color@csv: {{colors}}
{% endraw %}
{% endhighlight %}

You do not need to escape the `#` character in values or text blocks.

{% highlight cerb %}
{% raw %}
# This is a comment
article:
  title: Using #commands <-- not a comment
  format: markdown
  content@text:
    # Heading <-- not a comment
    
    Some **bold** text.
{% endraw %}
{% endhighlight %}

### References

You can break up a complex tree into manageable, reusable sections with _references_.

You define a reference by prefixing an ampersand (`&`) to a top-level key.

Any key can then use an `@ref` annotation to copy the contents and annotations of the reference.

{% highlight cerb %}
{% raw %}
picklist:
  options@ref: colors

&colors@list:
  red
  green
  blue
{% endraw %}
{% endhighlight %}

An `@ref` may target a child of a reference using dot-notation:

{% highlight cerb %}
{% raw %}
picklist:
  options@ref: options.colors

&options:
  colors@list:
    red
    green
    blue
{% endraw %}
{% endhighlight %}

And references themselves may contain `@ref` annotations:

{% highlight cerb %}
{% raw %}
picklist:
  options@ref: options.colors

&options:
  colors@ref: colors
  
&colors@list:
  red
  green
  blue
{% endraw %}
{% endhighlight %}

A reference's annotations take the place of `@ref`, and any remaining annotations will affect the copied content.

For instance, this copies a reference as a `@text` block and _then_ converts it to a `@list`:

{% highlight cerb %}
{% raw %}
picklist:
  options@ref,list: colors

&colors@text:
  red
  green
  blue
{% endraw %}
{% endhighlight %}

The result of all four examples above is:

{% highlight cerb %}
{% raw %}
picklist:
  options@list:
    red
    green
    blue
{% endraw %}
{% endhighlight %}

# Dictionaries

Features that use KATA may enable [scripting](/docs/scripting/) and provide a [dictionary](/docs/guide/developers/dictionaries/) of placeholders for dynamic content.

Placeholders and scripting may be used in any value and do not require escaping.

Use the [@raw](#raw) annotation to prevent tags from being parsed.

{% highlight cerb %}
{% raw %}
chooser:
  label: {{label}}
  params:
    record_type: {{record_type}}
{% endraw %}
{% endhighlight %}

# Annotation Reference

### base64

`@base64` converts a key's value from base64-encoded[^base64] text into binary. This is particularly useful for HMAC keys and images.

{% highlight cerb %}
{% raw %}
image@base64: QnVzdGVkISBUaGlzIGlzIG5vdCByZWFsbHkgYW4gaW1hZ2Uu
{% endraw %}
{% endhighlight %}

### bit

`@bit` convert's a key's value into a `0` or `1`.

The following values result in `0`:

* null/blank
* `0`
* `false`
* `off`
* `no`
* `n`

{% highlight cerb %}
{% raw %}
result@bit: off
{% endraw %}
{% endhighlight %}

Any other value returns a `1`.

### bool

`@bool` convert's a key's value into a boolean `true` or `false`.

The following values result in `false`:

* null/blank
* `0`
* `false`
* `off`
* `no`
* `n`

Any other value returns `true`.

{% highlight cerb %}
{% raw %}
enabled@bool: yes
{% endraw %}
{% endhighlight %}

### csv

`@csv` converts a comma-separated list into an array.

{% highlight cerb %}
{% raw %}
colors@csv: red,green,blue
{% endraw %}
{% endhighlight %}

### date

`@date` converts a human-readable absolute (`Jan 1 2025 08:00`) or relative (`+2 hours`) date text value into a Unix timestamp.

{% highlight cerb %}
{% raw %}
when@date: +2 hours
{% endraw %}
{% endhighlight %}

### int

`@int` parses the key's value as a whole number.

{% highlight cerb %}
{% raw %}
number@int: 123
{% endraw %}
{% endhighlight %}

### json

`@json` parses text as a JSON-encoded value.

This is particularly useful when combined with a placeholder based on an API response.

{% highlight cerb %}
{% raw %}
person@json:
  {
    "name": "Kina Halpue",
    "title": "Customer Support Manager"
  }

numbers@json: [1,2,3]
{% endraw %}
{% endhighlight %}

### key

`@key` sets the value from a [dictionary](#dictionaries) path.

{% highlight cerb %}
{% raw %}
http_status@key: response.http.status.code
{% endraw %}
{% endhighlight %}

### list

`@list` converts text into an array with one line per item.

{% highlight cerb %}
{% raw %}
colors@list:
  red
  green
  blue
{% endraw %}
{% endhighlight %}

### raw

`@raw` returns a key's text without substituting `{% raw %}{{placeholders}}{% endraw %}` or executing [bot scripts](/docs/scripting/) using the [dictionary](#dictionaries).

This is useful for returning templates to other functionality (e.g. [sheets](/docs/sheets/)).

{% highlight cerb %}
{% raw %}
template@raw:
  {{person}} is {{title}} at {{organization}}
{% endraw %}
{% endhighlight %}

### ref

`@ref` copies the contents of a top-level `&key:` into the current key.

This can target a reference by name (`key@ref: target`) or by path (`key@ref: target.nested.child.value`).

The annotations of the target key replace the `@ref`, and any remaining annotations apply to the copied content.

See: [References](#references)

{% highlight cerb %}
{% raw %}
event/start@ref: menu

&menu:
  options@list:
    Option 1
    Option 2
    Option 3
{% endraw %}
{% endhighlight %}

### text

`@text` reads the key's indented value as a text block. This continues until the indent returns to the same level as the key.

This is useful when a text block can't be implied from any other attributes.

{% highlight cerb %}
{% raw %}
content@text:
  This is a _bunch_ of content
  on several lines
  that stops **here**
format: markdown
{% endraw %}
{% endhighlight %}

The first trailing linefeed is always removed so that multiple line scripts can return a single value.

End the text block with one or more indented blank lines to keep linefeeds:

{% highlight cerb %}
{% raw %}
content@text:
  This content ends
  with a blank line
  
format: markdown
{% endraw %}
{% endhighlight %}

### trim

`@trim` removes leading and trailing whitespace from a key's value.

{% highlight cerb %}
{% raw %}
content@trim:    this has no whitespace    
{% endraw %}
{% endhighlight %}

{% comment %}
Kata is the word for "form" in Japanese, which refers to the refinement of perfected movements through repeated practice.

# Purpose

Cerb originally used "point and click" interfaces for searching, configuration, and automation -- buttons, checkboxes, menus, and so on.

While this approach started out simple to use, it quickly became convoluted and constraining as Cerb's capabilities grew.

Modern versions of Cerb embrace text-based formats for searching, data queries, and configuration.

### Why is text better?

Text is more expressive, flexible, automation-friendly.

Let's consider a simple 'Priority' field on tasks so we can work on them in this order:

* critical
* high
* normal 
* low

When adding a new task, we could just select the appropriate priority from a list using our human intuition, and click a 'Save' button.

If we needed to filter tasks by priority, we could select one or more priorities with checkboxes, and click a 'Search' button.

Nice and easy, so far.

But then one day, a new business requirement is introduced:

**Users need to search for their own tasks OR critical tasks with no owner.**

With our graphical interface, we can find issues assigned to us with any priority. We can find critical issues that are unassigned. But we can't do both at the same time.

Now we need the ability to create _groups_ of filters which merge their results together.

Each group would have its own assignee and priority filters.

Let's assume we figured it out. Now it's our job to explain to our co-workers how to do it.

Our steps would look like:

1. Click (+) to add two filter groups.

1. Add filters for assignee and priority into both groups.

1. In the first group, set assignee to "me" and priority to "any".

1. In the second group, set the assignee to "nobody" and the priority to "critical".

1. Select "OR" between the groups.

1. Click the "Search" button.

That's a lot of clicking and explaining. The filters take up half of our screen. We'd have to repeat those steps every time we change filters. We'd have to teach the process to every new hire. Across our entire team those steps would be repeated hundreds of times per day, wasting valuable human time.

So what's the alternative?

We could type a text _query_ like:

{% highlight cerb %}
owner:me OR (owner:nobody priority:critical)
{% endhighlight %}

Let's look at the advantages:

* The text query takes up minimal space on our screen. It's one text box rather than a bunch of menus and buttons.

* We can send the complete query to someone in email or chat. They can run it instantly without having to follow complex instructions.

* We can save our favorite and most frequently used queries in a simple text file.

* We can program a robot to search for issues by generating simple text queries, rather than automating the clicking of buttons and menus.

* The query can become much more complex with only a little more typing. What about all issues of high or critical priority, which are overdue, and are assigned to either me or any co-worker who is out of the office?

{% highlight cerb %}
priority:high,critical due:"before now" (owner:me OR owner:(available:no))
{% endhighlight %}

Then we have another new requirement:

**We need to automate the prioritization of new issues.**

{% endcomment %}

{% comment %}
The priority of new issues will automatically be set by software (a bot).

Priority is now a _dynamic_ field, whose appropriate value depends on various potentially complex conditions (the value of a client, the issue's impact on their workflow, etc).

This automation also needed to be created by a human

However, what about when a user wants to filter by issues that are assigned to them OR of critical priority and assigned to nobody.

an automation that needs to choose from

{% endcomment %}

# Footnotes

[^base64]: Base64: <https://en.wikipedia.org/wiki/Base64>

[^no-yaml]: NoYAML: <https://noyaml.com>

[^yaml]: YAML: <https://yaml.org>