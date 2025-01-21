---
title: Report a ticket as spam
excerpt: Report a ticket as spam with automations.
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
