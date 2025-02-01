---
title: Escape untrusted data query parameters
excerpt: Safely handle untrusted user input in data queries using query parameters.
summary: This page demonstrates how to securely handle user input in data queries
  by using query parameters. It shows how to prevent query injection attacks by using
  the ${...} syntax for parameter substitution instead of direct placeholder interpolation.
layout: solution
jumbotron:
  breadcrumbs:
  - label: Resources &raquo;
    url: /resources/
  - label: Solutions Hub &raquo;
    url: /solutions/
  - label: Automations &raquo;
    url: /solutions/#automations
social_image_url: /assets/images/solutions/automations/escape-data-query-params.png
redirect_from:
- /automation/cookbook/escape-data-query-params/
---

{% comment %}
* Uses query_params for safe parameter substitution
* Prevents query injection attacks
* Demonstrates secure vs. insecure approaches
* Shows proper parameter escaping
{% endcomment %}

## Safely handling untrusted user input in data queries

When using the [data.query:](/docs/automations/commands/data.query/) command, the `query_params:` option provides a secure way to substitute untrusted user input into queries.

Its value is a dictionary. The `${...}` placeholder syntax in a query references these sanitized keys. These placeholders aren't evaluated until the query is parsed, so they can never modify the structure of the query (e.g. changing other filters).

{% tabs escape_data_query_params %}

{% tab escape_data_query_params automation %}
```cerb
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
```
{% endtab %}

{% tab escape_data_query_params policy %}
```cerb
{% raw %}
commands:
  data.query:
    deny/type@bool: {{query.type != 'worklist.records'}}
    allow@bool: yes
{% endraw %}
```
{% endtab %}

{% endtabs %}

## Unsafe placeholders (vulnerable to injection)

Here's an example of an unsafe data query where malicious user input in the `{% raw %}{{email}}{% endraw %}` placeholder breaks out the filter and matches all records.

This happens because the placeholder is evaluated before the query is parsed.

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
