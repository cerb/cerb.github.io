---
title: "Automations: data.query"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/commands/data.query/
toc:
  title: data.query
  expand: Automations
jumbotron:
  title: data.query
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

The **data.query:** command executes a [data query](/docs/data-queries/) and returns the response.

<pre>
<code class="language-cerb">
{% raw %}
start:
  data.query:
    output: results
    inputs:
      query@text:
        type:worklist.records
        of:ticket
        format:dictionaries
    on_success:
      return:
        records@key: results:data
{% endraw %}
</code>
</pre>

* TOC
{:toc}

# Syntax

## inputs:

| Key | 
|-|-
| `query@text:` | A [data query](/docs/data-queries/) to run.
| `query_params` | Query parameters with untrusted user input as keys/values. Reference these as `${param}` in queries.

## output:

Save the results in this placeholder.

## on_simulate:

The [commands](/docs/automations/#commands) to run during simulation instead of the data query.

If omitted, the data query is executed during simulation.

## on_success:

The [commands](/docs/automations/#commands) to run on success.

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `data` | The response from the query.
| `_` | The metadata from the query.

## on_error:

The [commands](/docs/automations/#commands) to run on failure. If omitted, the automation exits in the `error` [state](/docs/automations/#exit-states).

The `output:` placeholder receives a dictionary with these keys:

| Key |
|-|-
| `error` | The error message.

