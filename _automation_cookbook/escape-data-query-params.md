---
title: Escape data query parameters
excerpt: Safely handle user input in data queries using query parameters.
summary: This page demonstrates how to securely handle user input in data queries by using query parameters. It shows how to prevent query injection attacks by using the ${...} syntax for parameter substitution instead of direct placeholder interpolation.
layout: integration
jumbotron:
  title: Escape data query parameters
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses query_params for safe parameter substitution
* Prevents query injection attacks
* Demonstrates secure vs. insecure approaches
* Shows proper parameter escaping
{% endcomment %}

The `query_params:` option provides a secure way to substitute user input into data queries. This prevents query injection attacks by properly escaping the input values.

## Safe query parameter usage

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
        query:(
          participant:(email:${email})
          status:o
        )
        format:dictionaries
      query_params:
        email: customer@cerb.example
{% endraw %}
</code>
</pre>

The `query_params:` option is a key-value object. The `${...}` syntax in a data query references those keys. This is more secure because `${...}` placeholders aren't evaluated until the query is parsed, so they can never modify the query structure.

## Unsafe direct interpolation (vulnerable to injection)

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    email: "blah") OR (id:>0
  data.query:
    output: results
    inputs:
      query@text:
        type:worklist.records
        of:ticket
        query:(
          participant:(email:{{email}})
          status:o
        )
        format:dictionaries
{% endraw %}
</code>
</pre>

## Policy

<pre>
<code class="language-cerb">
{% raw %}
commands:
  data.query:
    deny/type@bool: {{query.type != 'worklist.records'}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
