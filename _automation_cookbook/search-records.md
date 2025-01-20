---
title: Search records with a query
excerpt: Search records with an arbitrary query and save the results into a variable.
summary: 'This page provides instructions on using the `record.search` command in Cerb to query and load records for automation purposes. It includes examples of how to find open tickets and workers who have been active within the past 30 minutes. The page also outlines the policies for these queries, specifying conditions under which the `record.search` command is allowed or denied based on the type of record being queried.'
layout: integration
redirect_from:
  - /guides/bots/load-records/
jumbotron:
  title: Retrieve arbitrary records
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

**record.search** can be used to load records and make them available to an automation.

## Find open tickets:
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

Use this policy:
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

## Find workers active within the past 30 minutes:
<pre>
<code class="language-cerb">
{% raw %}
start:
  record.search:
    inputs:
      record_type: worker
      record_query: isDisabled:no lastActivity:${activity}
      record_query_params:
        activity: -30 mins
    output: results
{% endraw %}
</code>
</pre>

Use this policy:
<pre>
<code class="language-cerb">
{% raw %}
commands:
  record.search:
    deny/type@bool: {{inputs.record_type is not record type ('worker')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>