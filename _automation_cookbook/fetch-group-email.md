---
title: Fetch emails from a group
excerpt: Fetch all the emails of workers in a given group.
layout: integration
jumbotron:
  title: Fetch emails from a group
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

With `record.search` and `set` you can fetch all the emails of a given group of workers and save it to a key.

<pre>
<code class="language-cerb">
{% raw %}
start:
  record.search/workers:
    output: results_worker
    inputs:
      record_type: worker
      record_query: isDisabled:n group:(name:"Support")
      record_expand: address
  set:
    emails@csv: {{results_worker|column('address_email')|join(',')}}
{% endraw %}
</code>
</pre>

Use the policy:

<pre>
<code class="language-cerb">
{% raw %}
commands:
  record.search:
    deny/type@bool: {{inputs.record_type is not record type ('workers')}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
