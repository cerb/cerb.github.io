---
title: Get emails for group members
excerpt: Build a mailing list of group members.
summary: "This page provides a step-by-step guide on building a mailing list of group members using Cerb's automation features. It demonstrates how to use `record.search:` and `set:` commands to fetch all emails of specific workers who are not disabled and belong to the 'Support' group, saving them to a key called `emails@csv`. The example code shows how to execute these commands and customize the policy to restrict access to only include those workers."
layout: integration
jumbotron:
  title: Get emails for group members
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

With [record.search:](/docs/automations/commands/record.search/) and [set:](/docs/automations/commands/set/) you can fetch all the emails of a given group of workers and save it to a key.

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
