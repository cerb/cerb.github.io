---
title: Get a CSV list of participants 
excerpt: Create a CSV list of participant emails from a ticket
summary: 
layout: integration
jumbotron:
  title: Get a CSV list of participants
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

You can extract a comma-separated list of participant emails from a ticket using the following snippet in an automation:

<pre>
<code class="language-cerb">
{% raw %}
inputs:
  record/ticket:
    required@bool: yes
    record_type: ticket
    expand: participants

start:
  return:
    emails: {{inputs.ticket.participants|column('email')|join(',')}}
{% endraw %}
</code>
</pre>
