---
title: Extract text using regular expressions
excerpt: Use regular expression patterns to extract matching text within automation scripting.
summary: This page provides examples of using regular expressions in automation scripting to extract matching text. It demonstrates how to use a single capture group to extract an order ID from a string and how to use multiple capture groups to extract numerical values from a formatted string. The examples illustrate the syntax and methods for defining patterns and capturing specific parts of text using regular expressions in a scripting context.
layout: automation-cookbook
redirect_from:
  - /tips/regex-in-automations/
jumbotron: []
---

Here are examples of using regular expressions to extract matching text in automation scripting.

## Matching a single capture group

The pattern is a [KATA](/docs/kata/) key.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    text: Your Amazon Order #Z-1234-5678-9 has shipped!
    pattern: /Amazon Order #([A-Z0-9\-]+)/
  return:
    order_id: {{text|regexp(pattern, 1)}}
{% endraw %}
</code>
</pre>

## Setting the pattern as a variable

The pattern is a [scripting](/docs/scripting/) variable.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    mask@text:
      {% set text = "The ticket mask that I am looking for is: KRN-69622-357 something else" %}
      {% set pattern %}/[A-Z]{3}-\d{5}-\d{3}/{% endset %}
      {{text|regexp(pattern)}}
  
  outcome/hasMask:
    if@bool: {{mask}}
    then:
      return:
        output: The ticket mask is #: {{mask}}
{% endraw %}
</code>
</pre>

## Using multiple capture groups

The second argument to `|regexp` specifies the capture group to return.

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    text: (123,456)
    pattern: /^\((\d+),(\d+)\)$/
  return:
    x@int: {{text|regexp(pattern, 1)}}
    y@int: {{text|regexp(pattern, 2)}}
{% endraw %}
</code>
</pre>

## Returning all matches for all capture groups

Use the [regexp_match_all()](/docs/scripting/functions/#regexp_match_all) function to return multiple capture groups for all matches.

{% tabs example %}

{% tab example automation %}
```cerb
{% raw %}
start:
  set:
    headers@text:
      X-Mailer: Cerb
      From: customer@cerb.example
      To: support@cerb.example
  return:
    results@text:
      {% set results = regexp_match_all("#^(.*?): (.*?)$#m", headers) %}
      {{results|json_encode|json_pretty}}
{% endraw %}
```
{% endtab %}

{% tab example policy %}
```cerb
{% raw %}
__return:
  results: |-
    [
        [
            "X-Mailer: Cerb",
            "From: customer@cerb.example",
            "To: support@cerb.example"
        ],
        [
            "X-Mailer",
            "From",
            "To"
        ],
        [
            "Cerb",
            "customer@cerb.example",
            "support@cerb.example"
        ]
    ]
{% endraw %}
```
{% endtab %}

{% endtabs %}