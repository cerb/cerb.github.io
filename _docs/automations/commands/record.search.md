---
title: "Automations: record.search"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/record.search/
toc:
  title: record.search
  expand: Automations
jumbotron:
  title: record.search
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Commands &raquo;
    url: /docs/automations/#commands
---

The **record.search:** command returns record dictionaries from a search query.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.search:
    inputs:
      record_type: ticket
      record_query: status:${status}
      record_query_params:
        status: o
    output: results
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `record_type:` | The [record type](/docs/records/types/) to search.
| `record_query:` | The [search query](/docs/search/) to match. Use `limit:1` to return a single dictionary rather than an array of dictionaries.
| `record_query_params:` | Query parameters with untrusted user input as keys/values. Reference these as `${param}` in queries.

## output:

Save the search results as record dictionaries in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of searching records.

If omitted, records are searched during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder is an array of record dictionaries.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.