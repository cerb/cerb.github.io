---
title: Sheets
excerpt: Tabular data visualization with a fully customizable text-based schema.
permalink: /docs/sheets/
social_image_url: /assets/images/docs/sheets/sheets.png
jumbotron:
  title: Sheets
  tagline: Tabular data visualization with a fully customizable text-based schema
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="{{page.social_image_url}}" class="screenshot">
</div>

**Sheets** are a modern, automation-friendly data visualization that avoids the schematic rigidity of [**worklists**](/docs/worklists/). A sheet is still a collection of rows and columns, but its column are defined in a fully customizable YAML-based text schema. This text-based schema can live within a bot behavior or widget without having to be previously defined or saved.

Each column in a sheet has a type (e.g. card, date, text) with configurable options.

A _cell_ (the intersection of a specific row and column) doesn't have to relate to a schema field at all -- it can be a synthetic or computed value, translation, interactive element, deep-linked field, arbitrary output, etc.

Sheets use placeholder dictionaries to to render cells, and they receive their input from any data query that can generate dictionaries -- including [worklist.subtotals](/docs/data-queries/worklist/subtotals/) and a new [worklist.records](/docs/data-queries/worklist/records/) data query type that significantly simplifies fetching record data. This means that sheets can also easily format and display data from third-party APIs. The data query itself, being text, supports placeholders and bot scripting logic -- so you can determine which columns are available, or what a cell displays, based not only on aspects of the record, but also based on on who is looking at it, their permissions, etc.

State on sheets is maintained client-side, and paging/sorting/filtering is customized for the use case (e.g. bot interaction vs portal vs dashboard widget) -- essentially just passing simple information to the input data query.

For example, this **data query**:

<pre>
<code class="language-cerb">
type:worklist.records
of:ticket
query:(status:open limit:5)
expand:[initial_message_sender_org_,owner_]
format:dictionaries
</code>
</pre>

And this **sheet schema**:

<pre>
<code class="language-yaml">
{% raw %}
layout:
  style: table
  headings: true
  paging: true
  title_column: _label
columns:
- card:
    key: _label
    label: Ticket
    params:
      bold: true
- card:
    key: initial_message_sender__label
    label: Requester
    params:
      underline: false
- text:
    key: initial_message_sender_org_country
    label: Country
- text:
    key: group__label
    label: Group / Bucket
    params:
      value_template: >-
        {{group__label}} / {{bucket__label}}
- card:
    key: owner__label
    label: Owner
    params:
      image: true
      underline: false
- slider:
    key: importance
- date:
    key: updated
    label: Updated
    params:
      format: Y-m-d
{% endraw %}
</code>
</pre>

Will display this **sheet**:

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/sheet-example.png" class="screenshot">
</div>

Unlike a worklist that is limited to records, the results of the data query above could have come from anywhere (third-party API call, subtotals, computation). As text, sheets can be quickly modified and shared, retrieved from the API, or constructed dynamically by bots.

You'll also notice that we're displaying the country of the initial sender's organization as a column. The group and bucket are displayed as a single column. We're electing which columns to show cards and profile images for. We're changing the date format. All of this wasn't possible with worklists.

* TOC
{:toc}

## Layout

### Tables

By default, sheets display as a **table** of rows and columns.

<pre>
<code class="language-yaml">
layout:
  style: table
</code>
</pre>

### Fieldsets

<div class="cerb-screenshot">
<img src="/assets/images/releases/9.3/sheet-fieldsets.png" class="screenshot">
</div>

The `fieldsets` layout style displays rows as **fieldsets** (vertically) rather than a table (horizontal). This is useful on profiles to summarize a single record, and in mobile environments.

<pre>
<code class="language-yaml">
layout:
  style: fieldsets
</code>
</pre>

## Columns

### Card

The `card`  column type displays a link that opens the card popup for a particular record.

The record to display is specified with the `context:` and `id:` params for a static record (e.g. `task:123`), or `context_key:` and `id_key:` for displaying a dynamic record based on dictionary keys. If omitted, this defaults to the current record using `context_key: _context` and `id_key: id`. If `key:` ends with `_id` or `_label` (e.g. `group__label`) then Cerb will attempt to automatically figure out the context, id, and label by using the dictionary.

This is also capable of displaying cards for deeply-nested related records (e.g. ticket >> latest message >> sender >> org >> email).

Similarly, the label for the link can be specified using `label:` (static) or `label_key:` (dynamic).

If an `image: true` param is provided, a profile image will be displayed to the left of the link.

The `bold:` and `underline:` params control how the link is displayed.

<pre>
<code class="language-yaml">
columns:
- card:
    key: name
    label: Name
    params:
      context_key: _context
      id_key: id
      label_key: _label
      image: true
      bold: true
      underline: true
</code>
</pre>

### Date

The `date` column type displays a datetime in various formats. The default is a relative timestamp (e.g. "2 hours ago"). An arbitrary `format:` may be specified using options from <http://php.net/date>.

The timestamp can be provided as `value:` (a Unix timestamp in seconds) or `value_key:` (a dictionary key containing a Unix timestamp). When both of these are omitted, the `key:` is used.

<pre>
<code class="language-yaml">
columns:
- date:
    key: updated
    label: Updated
    params:
      format: d-M-Y H:i:s T # See: https://php.net/date
      #value: 1577836800
      #value_key: updated
</code>
</pre>

### Link

The `link` column type displays a relative or external link with some text.

The link is provided in the `href:` (or `href_key:`, `href_template:`) param. For instance: `/path/to/page`, `https://cerb.ai`.

The `text:` (or `text_key:`, `text_template:`) param provides the label of the link.

<pre>
<code class="language-yaml">
{% raw %}
columns:
- link:
    key: link
    label: Link
    params:
      #href: https://example.com/
      href_key: record_url
      #href_template: /profiles/task/{{id}}-{{title|permalink}}
      #text: Link title
      text_key: _label
      #text_template: "{{title}}"
{% endraw %}
</code>
</pre>

### Search

The `search` column type displays arbitrary text as a link with `label:` or (`label_key:`, `label_template:`).

Clicking the links runs search `query:` (or `query_key:`, `query_template:`) against `context:` (or `context_key:`, `context_template:`) records.

For instance, a table of calculated results could open a search popup to the source data.

<pre>
<code class="language-yaml">
{% raw %}
columns:
- search:
    key: count
    label: Count
    params:
      context: ticket
      #query_key: query
      query_template: owner.id:{{id}}
{% endraw %}
</code>
</pre>

### Search Button

The `search_button` column type displays a search button that opens a worklist popup with the results of a query for a given record type.

The record type to search is specified in the `context:` param (or `context_key:`, `context_template:`).

The `query:` (or `query_key:`, `query_template:`) param contains the search query.

The `label:` (or `label_key:`, `label_template:`) param provides the text of the search link.

<pre>
<code class="language-yaml">
{% raw %}
columns:
- search_button:
    key: assignments_search
    label: Assignments
    params:
      context: ticket
      #query_key: query
      query_template: owner.id:{{id}}
{% endraw %}
</code>
</pre>

### Slider

The `slider` column type visually displays a `value:` (or `value_key:`, `value_template:`) on a continuum with configurable `min:` and `max:` bounds. The output is similar to the "Importance" column on ticket/task worklists.

<pre>
<code class="language-yaml">
{% raw %}
columns:
- slider:
    key: importance
    label: Importance
    params:
      min: 0
      max: 100
      #value: 50
      #value_key: importance
      #value_template: "{{importance}}+10}}"
{% endraw %}
</code>
</pre>

### Text

The `text` column type displays arbitrary text as `value:` (or `value_key:`, `value_template:`) using bot scripting and placeholders. The default value is the column's `key:` in the placeholder dictionary.

Text columns may include a `value_map:` parameter for associating new labels to values. For instance, "F => Female" or "1 => Yes". This reduces the need for custom columns.

This type is usually the default when no column `type:` is specified.

<pre>
<code class="language-yaml">
{% raw %}
columns:
- text:
    key: gender
    label: Gender
    params:
      #value: Female
      #value_key: gender
      #value_template: "{{gender}}"
      value_map:
        F: Female
        M: Male
{% endraw %}
</code>
</pre>

### Time Elapsed

The `time_elapsed` column type convert units of time (like seconds) into human-friendly dates (e.g. "2 hours, 5 mins").

The `value:` (or `value_key:`, `value_template:`) parameter specifies the value. If omitted, the value of the column key is used.

The `precision` parameter controls how granular the date is. For instance, `precision: 3` is _"2 hours, 5 minutes, 29 seconds"_. The default is `2`.

<pre>
<code class="language-yaml">
columns:
- time_elapsed:
    key: elapsed_response_first
    label: First Response
    params:
      precision: 2
</code>
</pre>
