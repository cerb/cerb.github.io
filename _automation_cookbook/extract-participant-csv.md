---
title: Get a CSV list of ticket participants 
excerpt: Extract a comma-separated list of participant emails from a ticket.
summary: This page provides a guide on how to extract a comma-separated list of participant emails from a ticket using an automation in Cerb.
layout: integration
jumbotron:
  title: Get a CSV list of ticket participants
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
    emails: {{inputs.ticket.participants|column('email')|join(', ')}}
{% endraw %}
</code>
</pre>
