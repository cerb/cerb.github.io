---
title: Report a ticket as spam
excerpt: Report a ticket as spam with automations.
summary: "This page provides an integration guide for reporting a ticket as spam using automations in Cerb, a project management tool. The example demonstrates how to use the `cerb.commands.email.spam.train` command to report a specific ticket ID (1234) as spam and implement a policy that denies any other commands with similar functionality."
layout: integration
jumbotron:
  title: Report a ticket as spam
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

<pre>
<code class="language-cerb">
{% raw %}
start:
  api.command:
    output: results
    inputs:
      name: cerb.commands.email.spam.train
      params:
        ticket_id@int: 1234
{% endraw %}
</code>
</pre>

Use the policy:

<pre>
<code class="language-cerb">
{% raw %}
commands:
  api.command:
    deny/name@bool: {{inputs.name not in ['cerb.commands.email.spam.train']}}
    allow@bool: yes
{% endraw %}
</code>
</pre>
