---
title: Loop through search results
excerpt: "Use the `repeat:` command to iterate records from search results."
summary: This page demonstrates how to use the repeat function in automation scripting to efficiently iterate through search results. It shows best practices for processing multiple records using record IDs, making it useful for batch operations and record management tasks.
layout: integration
jumbotron:
  title: Loop through search results
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Record iteration best practices
* Efficient batch processing
* Search result handling
* Record expansion and custom fields
{% endcomment %}

Here is an example using the [repeat:](https://cerb.ai/docs/automations/commands/repeat/) command for iterating through record IDs (using `records[id]` notation) in automation scripting.

This approach is more efficient than looping through records directly since it doesn't duplicate the list during iteration.

## Processing search results

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.search:
    output: tickets
    inputs:
      record_type: ticket
      record_query: status:o limit:10
      record_expand: customfields
  
  repeat:
    each@csv: {{tickets|keys|join(',')}}  
    as: ticket_id
    do:
      log: Editing #{{ticket_id}} {{tickets[ticket_id]._label}}
{% endraw %}
</code>
</pre>

## Policy

<pre>
<code class="language-cerb">
{% raw %}
commands:
  record.search:
    deny/type@bool: {{inputs.record_type is not record type ('ticket')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
