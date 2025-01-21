---
title: Debug search query SQL
excerpt: Generate the underlying SQL statement for any record search query.
summary: This page demonstrates how to use the cerb.commands.worklist.query.debug command to expose the SQL query that powers any record search. This is valuable for debugging performance issues, understanding how queries are constructed, and optimizing search operations.
layout: integration
jumbotron:
  title: Debug search query SQL
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses api.command to access debug functionality
* Works with any record type
* Shows full SQL query structure
* Useful for performance optimization
* Helps with query troubleshooting
{% endcomment %}

You can use the **`cerb.commands.worklist.query.debug`** command to view the SQL statement that will be executed for any record search query.

## Debug a ticket search query

<pre>
<code class="language-cerb">
{% raw %}
start:
  api.command:
    output: results
    inputs:
      name: cerb.commands.worklist.query.debug
      params:
        record_type: ticket
        query: status:o created:"-1 week" group:(name:"Support")
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
results:
  sql: SELECT t.id AS t_id , t.updated_date AS t_updated_date FROM ticket t  WHERE
    t.status_id IN (0)  AND t.created_date BETWEEN 1736496000 and 1737155624 AND t.group_id
    IN (SELECT g.id FROM worker_group g WHERE (g.name = 'Support') )  ORDER BY t_updated_date
    DESC LIMIT 0,10
{% endraw %}
</code>
</pre>

## Policy

<pre>
<code class="language-cerb">
{% raw %}
commands:
  api.command:
    deny/name@bool: {{inputs.name not in ['cerb.commands.worklist.query.debug']}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
