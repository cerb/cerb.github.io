---
title: Search queries
excerpt: 
social_image_url: /assets/images/search/search.png
permalink: /docs/search/
redirect_from:
  - /docs/search/autocompletion/
  - /docs/search/filters/
  - /docs/search/deep-search
  - /docs/search/and-or/
  - /docs/search/sorting/
toc:
  title: Search
jumbotron:
  title: Search Queries
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

**Search queries** are a text-based language for filtering [records](/docs/records/). They are efficient, expressive, and automation-friendly.

* TOC
{:toc}

Using queries, search functionality is consistent between [automations](/docs/automations/), [worklists](/docs/worklists/), [data queries](/docs/data-queries/), and [API requests](/docs/api/endpoints/records/#search).

As text, queries can be built dynamically using [bot scripting](/docs/scripting/) syntax. They also simplify many complex operations that would otherwise be tedious (or impossible) to automate or represent with web-based forms.

To give you an idea of what you can do with queries, here's an example query that returns open tickets in the Sales or Support group that are less than a month old:

<pre>
<code class="language-cerb">
{% raw %}
status:open created:"-1 month" group:(sales OR support)
{% endraw %}
</code>
</pre>

In the following sections we'll cover query syntax and advanced functionality.

### Searching records

You can use the global search menu to filter any [record type](/docs/records/types/):

<div class="cerb-screenshot">
<img src="/assets/images/docs/search/search-menu.png" class="screenshot">
</div>

{% comment %}
* TOC
{:toc}

* choosers/search
* subtotals

Easy to share

The owner of a workspace can also add special **required query** to a worklist that cannot be changed by other users of the worklist.

For instance, if a worklist is meant to only show open conversations from clients with a service level agreement, then no additional filtering can change that constraint.  Every other filter will act only against those matching records.
{% endcomment %}

# Filters

A query is a list of **filters** separated by a space. Each filter uses the format:

<pre>
<code class="language-cerb">
{% raw %}
filter:expression
{% endraw %}
</code>
</pre>

The possible **expressions** depend on the type of filter:

## Text

These expressions can be used on text-based [filters](/docs/search/#filters).

#### Term
{:.no_toc}

Simple text (without spaces) can be used as the entire expression:

<pre>
<code class="language-cerb">
{% raw %}
firstName:Kina
{% endraw %}
</code>
</pre>

#### Phrases
{:.no_toc}

Enclose phrases in double quotes (`"`):

<pre>
<code class="language-cerb">
{% raw %}
subject:"This phrase contains spaces"
{% endraw %}
</code>
</pre>

#### Wildcards
{:.no_toc}

Use asterisks (`*`) to denote wildcards:

<pre>
<code class="language-cerb">
{% raw %}
mask:abc*
{% endraw %}
</code>
</pre>

#### Sets
{:.no_toc}

Find records that match _any_ of the given values:

<pre>
<code class="language-cerb">
{% raw %}
color:[red,green,blue]
{% endraw %}
</code>
</pre>

#### Negation
{:.no_toc}

Prefix an expression with an exclamation point (`!`) to negate it. This returns any records that don't match.

<pre>
<code class="language-cerb">
{% raw %}
status:!open
{% endraw %}
</code>
</pre>

## Fulltext

Many records provide a default **full-text** [filter](/docs/search/#filters) that's used when you type an expression without specifying a filter.

This is a more efficient way to search [records](/docs/records/) with a large amount of text (e.g. email messages, comments).

{% comment %}
* stop words
* default search
  {% endcomment %}

#### Terms
{:.no_toc}

By default, records will be returned if they match all of the given terms.

<pre>
<code class="language-cerb">
{% raw %}
bug bluetooth report
{% endraw %}
</code>
</pre>

#### Phrases
{:.no_toc}

Enter text within quotes to search for exact phrases:

<pre>
<code class="language-cerb">
{% raw %}
"bug report"
{% endraw %}
</code>
</pre>

#### Mixing terms and phrases
{:.no_toc}

(Added in [10.1](/releases/10.1/))

<pre>
<code class="language-cerb">
{% raw %}
content:("an exact phrase" other terms)
{% endraw %}
</code>
</pre>

#### Negation
{:.no_toc}

(Added in [10.1](/releases/10.1/))

<pre>
<code class="language-cerb">
{% raw %}
text:!(not these words)
{% endraw %}
</code>
</pre>

## Numbers

These expressions can be used on numeric [filters](/docs/search/#filters).

#### Equal
{:.no_toc}

To filter by records with an exact numeric value, use a number as the expression:

<pre>
<code class="language-cerb">
{% raw %}
age:35
{% endraw %}
</code>
</pre>

#### Not Equal
{:.no_toc}

Find all records that don't match a value by prefixing the expression with an exclamation point (`!`):

<pre>
<code class="language-cerb">
{% raw %}
priority:!1
{% endraw %}
</code>
</pre>

#### Greater than
{:.no_toc}

To filter by records with a value greater than the expression, use `>` or `>=`:

<pre>
<code class="language-cerb">
{% raw %}
age:&gt;21
{% endraw %}
</code>
</pre>

#### Less than
{:.no_toc}

To filter by records with a value less than the expression, use `<` or `<=`:

<pre>
<code class="language-cerb">
{% raw %}
order:&lt;=100
{% endraw %}
</code>
</pre>

#### Between
{:.no_toc}

Find records with a value within a range by using `...`:

<pre>
<code class="language-cerb">
{% raw %}
importance:25...75
{% endraw %}
</code>
</pre>

#### Sets
{:.no_toc}

Find records that match _any_ of the given values:

<pre>
<code class="language-cerb">
{% raw %}
importance:[0,50,75]
{% endraw %}
</code>
</pre>

## Booleans

These expressions can be used on boolean [filters](/docs/search/#filters).

#### True
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

#### False
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

## Dates

These expressions can be used on date-based [filters](/docs/search/#filters).

#### Since
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

#### Between
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

#### Advanced

Since: [9.6](/releases/9.6/)

Date-based filters may use an optional advanced parameterized expression, with the format:

<pre>
<code class="language-cerb">
{% raw %}
created:(since:"-1 week" until:now months:Jan,Feb,Mar days:Weekdays times:9a-5p)
{% endraw %}
</code>
</pre>

The `since:` option sets the beginning of the date range (default `big bang`).

The `until:` option sets the end of the date range (default `now`).

The `months:` option accepts a comma-delimited list of months to include within in the range (default everything). You can use any unique prefix on English months of the year (e.g. `Ja,F,Mar`, `o,n,d`, `Jun,Jul`).

The `weeks:` option accepts a comma-delimited list of weeks to include within in the range (default everything). Where Sunday is the first day of the week (e.g. `00` to `53`).

The `days:` option accepts a comma-delimited list of days to include within in the range (default everything). You can use aliases for `weekdays` and `weekends`, and any unique prefix on English days of the week (e.g. `Mon,Wed,Fri`, `m,w,f`, `thu,f`).

The `dom:` option accepts a comma-delimited list of days of the month to include within in the range (default everything), from `1` to `31`.

The `times:` option accepts a comma-delimited list of time ranges to include for the given days (e.g. `8a-noon,1-6p`). For instance, this makes it much easier to query only working hours within a date range.

## Nullness

You can match records by having, or not having, any value for a particular [filter](/docs/search/#filters).

This is particularly useful for [custom fields](/docs/custom-fields/).

#### Null
{:.no_toc}

Use the expression `null` to find records _without_ any value set:

<pre>
<code class="language-cerb">
{% raw %}
sla.level:null
{% endraw %}
</code>
</pre>

#### Not null
{:.no_toc}

Use the expression `!null` to find records _with_ any value set:

<pre>
<code class="language-cerb">
{% raw %}
checkbox:!null
{% endraw %}
</code>
</pre>

## Choosers

**Chooser** [filters](/docs/search/#filters) match fields that contain [record](/docs/records/) IDs.

By convention, these filter names usually have an `.id` suffix (e.g. `bucket.id:`).

Chooser filters support all [numeric](/docs/search/#numbers) expressions.

#### ID
{:.no_toc}

To find records with a single matching record ID:

<pre>
<code class="language-cerb">
{% raw %}
group.id:1
{% endraw %}
</code>
</pre>

#### IDs
{:.no_toc}

To find records matching any of a list of record IDs:

<pre>
<code class="language-cerb">
{% raw %}
group.id:[1,2,3]
{% endraw %}
</code>
</pre>

## Links

These expressions can be used on link [filters](/docs/search/#filters).

#### Link to record type
{:.no_toc}

To filter by records with a link to a specific other [record type](/docs/records/types/), use its alias as the expression:

<pre>
<code class="language-cerb">
{% raw %}
links:ticket
{% endraw %}
</code>
</pre>

#### Deep search by links
{:.no_toc}

You can also use [deep search](/docs/search/#deep-search) to filter records based on any property of linked records.

Append the [record type alias](/docs/records/types/) to `links` following a period (`.`), then the expression can be any [search query](/docs/search/) for that record type:

<pre>
<code class="language-cerb">
{% raw %}
links.ticket:(mask:a*)
{% endraw %}
</code>
</pre>

## Watchers

These expressions can be used on watcher [filters](/docs/search/#filters).

#### Names
{:.no_toc}

To filter for records watched by specific workers, enter partial names:

<pre>
<code class="language-cerb">
{% raw %}
watchers:kina,karl
{% endraw %}
</code>
</pre>

#### Me
{:.no_toc}

To filter for records you're watching, use the `me` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:me
{% endraw %}
</code>
</pre>

#### Any
{:.no_toc}

To filter for records watched by any workers, use the `any` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:any
{% endraw %}
</code>
</pre>

#### None
{:.no_toc}

To filter for records **not** watched by any workers, use the `none` expression:

<pre>
<code class="language-cerb">
{% raw %}
watchers:none
{% endraw %}
</code>
</pre>

#### IDs
{:.no_toc}

To filter for records watched by specific worker IDs, enter a comma-separated list of IDs:

<pre>
<code class="language-cerb">
{% raw %}
watchers:1,2,3
{% endraw %}
</code>
</pre>

# Autocompletion

As you type a query in the browser, **autocomplete suggestions** will assist you:

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/code_editor_autocomplete.gif" class="screenshot">
</div>

You can also manually open the suggestion menu with the `<Control> + <Space>` keyboard shortcut.

# Deep Search

Some [filters](/docs/search/#filters) represent [links](/docs/records/links/) between related [records](/docs/records/).

The expression for these filters is another [search query](/docs/search/) based on the linked record type.

We refer to this as **deep searching** because you can chain these searches to any depth.

For instance, you can build a worklist of email messages sent by organizations in the health care industry, in Europe, and who also have at least one female contact with a name that starts with the letter 'M'.

This is one of the most powerful features in Cerb.

### Deep search

When performing a deep search, your expression is another search query:

<pre>
<code class="language-cerb">
{% raw %}
status:open group:(name:S*)
{% endraw %}
</code>
</pre>

The above example returns records that are open and in a group that begin with the letter _'S'_.

### Multiple deep searches

You can perform multiple deep searches at once:

<pre>
<code class="language-cerb">
{% raw %}
owner:(gender:f) 
group:(name:[support,sales]) 
org:(sla.plan:!null)
{% endraw %}
</code>
</pre>

The above example returns records owned by a female worker, in the _Support_ or _Sales_ group, from an organization with any service level agreement (a [custom fieldset](/docs/custom-fieldsets/) picklist).

### Deeper search

You can perform a deep search, within a deep search, within a deep search (ad nauseam):

<pre>
<code class="language-cerb">
{% raw %}
messages.first:(
  sender:(
    org:(
      company.industries:"Health Care" 
      region:Europe 
      sla.plan:Priority
    )
  )
)
{% endraw %}
</code>
</pre>

The above example returns records where the sender of the first message is a member of an organization in the health care industry in Europe with a "Priority" service level agreement.

### Negation

You can also negate a deep search by prefixing an exclamation mark (`!`). This returns all records that **don't match**:

<pre>
<code class="language-cerb">
{% raw %}
group:!(name:S*)
{% endraw %}
</code>
</pre>

The above example returns records that are in a group whose name **doesn't** start with the letter _'S'_.

# Boolean Groups

You can group [filters](/docs/search/#filters) into `AND` and `OR` (boolean) sets.

### AND

Return records that match **all** of the given filters:

<pre>
<code class="language-cerb">
{% raw %}
status:open AND created:today AND group:support
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
status:open created:today group:support
{% endraw %}
</code>
</pre>

<div class="cerb-box note">
<p>A query automatically uses <code>AND</code> by default if you specify multiple filters and separate them with a space.</p>
</div>

### OR

Return records that match **any** of the given filters:

<pre>
<code class="language-cerb">
{% raw %}
owner.id:me OR owner.id:none
{% endraw %}
</code>
</pre>

The above example will return records that are "owned by the current worker" or "have no owner". It will exclude records owned by any other worker.

### NOT

You can prefix a boolean filter group with an exclamation mark (`!`) to negate it:

<pre>
<code class="language-cerb">
{% raw %}
!(mimetype:image/png size:<100KB)
{% endraw %}
</code>
</pre>

The above example will return everything **except** "PNGs smaller than 100KB".

### Multiple boolean filter groups

You can mix boolean filter groups by using parentheses (`()`):

<pre>
<code class="language-cerb">
{% raw %}
(mimetype:image/png size:&gt;100KB) OR (mimetype:image/jpeg size:&lt;100KB)
{% endraw %}
</code>
</pre>

The above example will return **both** "PNGs larger than 100KB" and "JPEGs smaller than 100KB".

A special `sort:` [filter](/docs/search/#filters) is available on every record type.

# Sorting

### Sort ascending

To sort matching records in ascending order (e.g. A-Z, oldest-newest), specify a filter name:

<pre>
<code class="language-cerb">
{% raw %}
sort:subject
{% endraw %}
</code>
</pre>

### Sort descending

To sort matching records in descending order (e.g. Z-A, newest-oldest), prefix the filter name with a dash (`-`):

<pre>
<code class="language-cerb">
{% raw %}
sort:-updated
{% endraw %}
</code>
</pre>

### Nested sorting

You can also sort by multiple fields by separating filter names with a comma (`,`).

For example, to return the most important and oldest issues first:

<pre>
<code class="language-cerb">
{% raw %}
sort:-importance,created
{% endraw %}
</code>
</pre>

If multiple records shared `importance:90`, they would be sub-sorted by `created` so the oldest record is first and newest is last.

You can perform nested sorting to any depth, but results will take longer to return the deeper you go.
