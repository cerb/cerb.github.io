---
title: Search query filters
excerpt:
social_image_url: /assets/images/search/search.png
permalink: /docs/search/filters/
toc:
  title: Filters
jumbotron:
  title: Filters
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Search &raquo;
    url: /docs/search/
---

A query is a list of **filters** separated by a space. Each filter uses the format:

<pre>
<code class="language-cerb">
{% raw %}
filter:expression
{% endraw %}
</code>
</pre>

The possible **expressions** depend on the type of filter:

* TOC
{:toc}

# Text

These expressions can be used on text-based [filters](/docs/search/filters/).

### Term
{:.no_toc}

Simple text (without spaces) can be used as the entire expression:

<pre>
<code class="language-cerb">
{% raw %}
firstName:Kina
{% endraw %}
</code>
</pre>

### Phrases
{:.no_toc}

Enclose phrases in double quotes (`"`):

<pre>
<code class="language-cerb">
{% raw %}
subject:"This phrase contains spaces"
{% endraw %}
</code>
</pre>

### Wildcards
{:.no_toc}

Use asterisks (`*`) to denote wildcards:

<pre>
<code class="language-cerb">
{% raw %}
mask:abc*
{% endraw %}
</code>
</pre>

### Sets
{:.no_toc}

Find records that match _any_ of the given values:

<pre>
<code class="language-cerb">
{% raw %}
color:[red,green,blue]
{% endraw %}
</code>
</pre>

### Negation
{:.no_toc}

Prefix an expression with an exclamation point (`!`) to negate it. This returns any records that don't match.

<pre>
<code class="language-cerb">
{% raw %}
status:!open
{% endraw %}
</code>
</pre>

# Fulltext

Many records provide a default **full-text** [filter](/docs/search/filters/) that's used when you type an expression without specifying a filter.

This is a more efficient way to search [records](/docs/records/) with a large amount of text (e.g. email messages, comments).

{% comment %}
* stop words
* default search
{% endcomment %}

### Terms
{:.no_toc}

By default, records will be returned if they match all of the given terms.

<pre>
<code class="language-cerb">
{% raw %}
bug bluetooth report
{% endraw %}
</code>
</pre>

### Phrases
{:.no_toc}

Enter text within quotes to search for exact phrases:

<pre>
<code class="language-cerb">
{% raw %}
"bug report"
{% endraw %}
</code>
</pre>

# Numbers

These expressions can be used on numeric [filters](/docs/search/filters/).

### Equal
{:.no_toc}

To filter by records with an exact numeric value, use a number as the expression:

<pre>
<code class="language-cerb">
{% raw %}
age:35
{% endraw %}
</code>
</pre>

### Not Equal
{:.no_toc}

Find all records that don't match a value by prefixing the expression with an exclamation point (`!`):

<pre>
<code class="language-cerb">
{% raw %}
priority:!1
{% endraw %}
</code>
</pre>

### Greater than
{:.no_toc}

To filter by records with a value greater than the expression, use `>` or `>=`:

<pre>
<code class="language-cerb">
{% raw %}
age:&gt;21
{% endraw %}
</code>
</pre>

### Less than
{:.no_toc}

To filter by records with a value less than the expression, use `<` or `<=`:

<pre>
<code class="language-cerb">
{% raw %}
order:&lte;100
{% endraw %}
</code>
</pre>

### Between
{:.no_toc}

Find records with a value within a range by using `...`:

<pre>
<code class="language-cerb">
{% raw %}
importance:25...75
{% endraw %}
</code>
</pre>

### Sets
{:.no_toc}

Find records that match _any_ of the given values:

<pre>
<code class="language-cerb">
{% raw %}
importance:[0,50,75]
{% endraw %}
</code>
</pre>

# Booleans

These expressions can be used on boolean [filters](/docs/search/filters/).

### True
{:.no_toc}

To filter for records with a `true` boolean value, you can use the expressions:

* `yes`
* `y`
* `true`

<pre>
<code class="language-cerb">
{% raw %}
checkbox:y
{% endraw %}
</code>
</pre>

### False
{:.no_toc}

To filter for records with a `false` boolean value, you can use the expressions:

* `no`
* `n`
* `false`

<pre>
<code class="language-cerb">
{% raw %}
isAdmin:n
{% endraw %}
</code>
</pre>

# Dates

These expressions can be used on date-based [filters](/docs/search/filters/).

### Since
{:.no_toc}

To filter by records with a date after a given point in time:

<pre>
<code class="language-cerb">
{% raw %}
created:today
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"-1 month"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"2018-01-01"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"January 1 2018"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"first day of this month"
{% endraw %}
</code>
</pre>

### Between
{:.no_toc}

To filter by records with a date within a given range, provide two dates separated by the word `to`:

<pre>
<code class="language-cerb">
{% raw %}
created:"today to now"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"January 1 to June 30"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"-1 year to -6 months"
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
created:"big bang to first day of this month"
{% endraw %}
</code>
</pre>

# Nullness

You can match records by having, or not having, any value for a particular [filter](/docs/search/filters/).

This is particularly useful for [custom fields](/docs/custom-fields/).

### Null
{:.no_toc}

Use the expression `null` to find records _without_ any value set:

<pre>
<code class="language-cerb">
{% raw %}
sla.level:null
{% endraw %}
</code>
</pre>

### Not null
{:.no_toc}

Use the expression `!null` to find records _with_ any value set:

<pre>
<code class="language-cerb">
{% raw %}
checkbox:!null
{% endraw %}
</code>
</pre>

# Choosers

**Chooser** [filters](/docs/search/filters/) match fields that contain [record](/docs/records/) IDs.

By convention, these filter names usually have an `.id` suffix (e.g. `bucket.id:`).

Chooser filters support all [numeric](/docs/search/filters/numbers/) expressions.

### ID
{:.no_toc}

To find records with a single matching record ID:

<pre>
<code class="language-cerb">
{% raw %}
group.id:1
{% endraw %}
</code>
</pre>

### IDs
{:.no_toc}

To find records matching any of a list of record IDs:

<pre>
<code class="language-cerb">
{% raw %}
group.id:[1,2,3]
{% endraw %}
</code>
</pre>

# Links

These expressions can be used on link [filters](/docs/search/filters/).

### Link to record type
{:.no_toc}

To filter by records with a link to a specific other [record type](/docs/records/types/), use its alias as the expression:

<pre>
<code class="language-cerb">
{% raw %}
links:ticket
{% endraw %}
</code>
</pre>

### Deep search by links
{:.no_toc}

You can also use [deep search](/docs/search/deep-search/) to filter records based on any property of linked records.

Append the [record type alias](/docs/records/types/) to `links` following a period (`.`), then the expression can be any [search query](/docs/search/) for that record type:

<pre>
<code class="language-cerb">
{% raw %}
links.ticket:(mask:a*)
{% endraw %}
</code>
</pre>

# Watchers

These expressions can be used on watcher [filters](/docs/search/filters/).

### Names
{:.no_toc}

To filter for records watched by specific workers, enter partial names:

<pre>
<code class="language-cerb">
{% raw %}
watchers:kina,karl
{% endraw %}
</code>
</pre>

### Me
{:.no_toc}

To filter for records you're watching, use the `me` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:me
{% endraw %}
</code>
</pre>

### Any
{:.no_toc}

To filter for records watched by any workers, use the `any` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:any
{% endraw %}
</code>
</pre>

### None
{:.no_toc}

To filter for records **not** watched by any workers, use the `none` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:none
{% endraw %}
</code>
</pre>

### IDs
{:.no_toc}

To filter for records watched by specific worker IDs, enter a comma-separated list of IDs:

<pre>
<code class="language-cerb">
{% raw %}
watchers:1,2,3
{% endraw %}
</code>
</pre>
